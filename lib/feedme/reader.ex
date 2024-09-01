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
    # feeds = [%{url: "https://letterstoanewdeveloper.com/feed/"}]

    tasks = Enum.map(feeds, &Task.async(fn -> refresh_feed(&1.url) end))

    results =
      Enum.flat_map(tasks, &Task.await(&1))
      |> Enum.filter(fn item -> item.valid? end)

    valids = Enum.filter(results, fn changeset -> changeset.valid? end)
    invalids = Enum.filter(results, fn changeset -> !changeset.valid? end)

    IO.puts("Valid items: #{Enum.count(valids)}, Invalid items: #{Enum.count(invalids)}")

    # TODO: Insert results to DB
  end

  def refresh_feed(url) when is_binary(url) do
    IO.puts("Fetching feed #{url}")

    with {:ok, %{body: body, status: status}} <- Req.get(url: url),
         feed_type <- detect_type(body),
         items <- handle_feed(status, feed_type, body, url) do
      items
    else
      {:error, error} ->
        IO.puts("Error fetching feed #{url}")
        IO.inspect(error)
        []
    end
  end

  def detect_type(body) do
    # Awful hack to determine if it's an RSS feed or Atom feed
    # Consider using a proper XML library to parse the feed
    start = String.slice(body, 0..300)

    # RSS 1.0 starts with <rdf:RDF, RSS 2.0 starts with <rss
    if String.contains?(start, "<rss") or String.contains?(start, "<rdf:RDF") do
      :rss
    else
      # Atom feed starts with <feed
      :atom
    end
  end

  def handle_feed(200, :rss, body, url) do
    parse_rss_feed(url, body)
  end

  def handle_feed(200, :atom, body, url) do
    parse_atom_feed(url, body)
  end

  def handle_feed(status, _, _, url) do
    {:error, "HTTP status #{status} fetching feed #{url}"}
  end

  def parse_rss_feed(_url, raw_feed) do
    with {:ok, feed} <- FastRSS.parse_rss(raw_feed) do
      items = Map.get(feed, "items")
      Enum.map(items, &parse_rss_item/1)
    end
  end

  def parse_atom_feed(_url, raw_feed) do
    with {:ok, feed} <- FastRSS.parse_atom(raw_feed) do
      items = Map.get(feed, "entries")
      Enum.map(items, &parse_atom_item/1)
    end
  end

  def parse_rss_item(item) do
    Item.changeset(%Item{}, %{
      title: Map.get(item, "title"),
      body: parse_body(item),
      published_at: get_published_at(item),
      url: Map.get(item, "link")
    })
  end

  def parse_atom_item(item) do
    Item.changeset(%Item{}, %{
      title: Map.get(item, "title") |> Map.get("value"),
      body: parse_body(item),
      published_at: get_published_at(item),
      url: Map.get(item, "links") |> Enum.find(&(&1["rel"] == "alternate")) |> Map.get("href")
    })
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
