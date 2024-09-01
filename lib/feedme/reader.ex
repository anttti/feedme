# Atom spec: https://validator.w3.org/feed/docs/atom.html

defmodule Feedme.Reader do
  import Ecto.Query

  alias Feedme.Reader.Item
  alias Feedme.Reader.Feed
  alias Feedme.Repo

  # TODO
  #
  # Follow redirects, validate that 2xx is returned
  # Insert as bulk operation
  # Calculate MD5 hash for title + body to see if they're updated

  def refresh_feeds(offset, limit) do
    feeds = from(Feed, limit: ^limit, offset: ^offset) |> Repo.all()

    # feeds = Repo.all(Feed)

    tasks = Enum.map(feeds, &Task.async(fn -> refresh_feed(&1.id, &1.url) end))

    results =
      Enum.flat_map(tasks, fn task ->
        # try/catch so that if a feed fetch fails, it does not take down the whole process
        try do
          Task.await(task, 1000)
        catch
          error, _ ->
            IO.puts("CAUGHT!")
            IO.inspect(error)
            []
        end
      end)
      |> Enum.filter(fn item -> item.valid? end)

    valids =
      Enum.filter(results, fn changeset -> changeset.valid? end)
      # Have to get the `.changes` to get the actual data fields, as that's how
      # Repo.insert_all works
      |> Enum.map(fn changeset -> changeset.changes end)

    invalids = Enum.filter(results, fn changeset -> !changeset.valid? end)

    IO.puts("Valid items: #{Enum.count(valids)}, Invalid items: #{Enum.count(invalids)}")

    insert_in_chunks(valids)

    {:ok, Enum.count(valids)}
  end

  def insert_in_chunks(items) do
    Enum.chunk_every(items, 1000)
    |> Enum.map(fn chunk -> Repo.insert_all(Item, chunk) end)
  end

  def refresh_feed(id, url) when is_binary(url) do
    IO.puts("Fetching feed #{id}: #{url}")

    with {:ok, %{body: body, status: status}} <-
           Req.get(url: url, retry_log_level: false, max_retries: 1),
         feed_type <- detect_type(body),
         items <- handle_feed(status, feed_type, body, id, url) do
      items
    else
      {:error, error} ->
        IO.puts("Error fetching feed #{id}: #{url}")
        IO.inspect(error)
        []
    end
  end

  def detect_type(body) do
    # Awful hack to determine if it's an RSS feed or Atom feed
    # Consider using a proper XML library to parse the feed

    # RSS 1.0 starts with <rdf:RDF, RSS 2.0 starts with <rss
    if String.contains?(body, "<rss") or String.contains?(body, "<rdf:RDF") do
      :rss
    else
      # Atom feed starts with <feed
      :atom
    end
  end

  def handle_feed(200, :rss, body, id, url) do
    parse_rss_feed(id, url, body)
  end

  def handle_feed(200, :atom, body, id, url) do
    parse_atom_feed(id, url, body)
  end

  def handle_feed(status, _, _, id, url) do
    IO.puts("HTTP status #{status} fetching feed #{id}: #{url}")
    []
  end

  def parse_rss_feed(feed_id, url, raw_feed) do
    with {:ok, feed} <- FastRSS.parse_rss(raw_feed) do
      items = Map.get(feed, "items")
      Enum.map(items, fn item -> parse_rss_item(feed_id, item) end)
    else
      _ ->
        IO.puts("Error parsing RSS feed #{url}")
        []
    end
  end

  def parse_atom_feed(feed_id, url, raw_feed) do
    with {:ok, feed} <- FastRSS.parse_atom(raw_feed) do
      items = Map.get(feed, "entries")
      Enum.map(items, fn item -> parse_atom_item(feed_id, item) end)
    else
      _ ->
        IO.puts("Error parsing Atom feed #{url}")
        []
    end
  end

  def parse_rss_item(feed_id, item) do
    Item.changeset(%Item{}, %{
      title: Map.get(item, "title"),
      body: parse_body(item),
      published_at: get_published_at(item),
      url: Map.get(item, "link"),
      feed_id: feed_id
    })
  end

  def parse_atom_item(feed_id, item) do
    Item.changeset(%Item{}, %{
      title: Map.get(item, "title") |> Map.get("value"),
      body: parse_body(item),
      published_at: get_published_at(item),
      url: get_atom_item_url(item),
      feed_id: feed_id
    })
  end

  def get_atom_item_url(item) do
    # Sometimes the `id` prop contains the URL, other times it's in the `links` prop
    id_url = Map.get(item, "id")

    url =
      if String.starts_with?(id_url, "http"),
        do: id_url,
        else: Map.get(item, "links") |> Enum.find(&(&1["rel"] == "alternate")) |> Map.get("href")

    url
  end

  def get_published_at(item) do
    cond do
      Map.has_key?(item, "updated") ->
        parse_date(Map.get(item, "updated"))

      Map.has_key?(item, "published") ->
        parse_date(Map.get(item, "published"))

      Map.has_key?(item, "pub_date") ->
        parse_date(Map.get(item, "pub_date"))

      true ->
        # No date field present so default to now
        DateTime.now!("Europe/Helsinki")
    end
  end

  def parse_date(nil) do
    DateTime.now!("Europe/Helsinki")
  end

  def parse_date(str) do
    with {:error, _} <- Timex.parse(str, "{ISO:Extended:Z}"),
         {:error, _} <- Timex.parse(str, "{RFC1123}") do
      # Could not parse the date so default to now
      parse_date(nil)
    else
      {:ok, result} -> result
    end
  end

  def parse_body(item) do
    fields = ["content", "summary", "description"]

    body =
      Enum.reduce(fields, nil, fn field, acc ->
        case Map.get(item, field) do
          nil -> acc
          body -> body
        end
      end)

    # Sometimes the body is a map with a "value" key, other times it's just a string
    cond do
      is_map(body) -> Map.get(body, "value")
      true -> body
    end
  end
end
