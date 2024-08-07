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

  def refresh_feeds() do
    # feeds = from(Feed, limit: 20, offset: 20) |> Repo.all()

    # feeds = Repo.all(Feed)

    feeds = [%{id: 1, url: "https://blog.rongarret.info/feeds/posts/default"}]

    tasks = Enum.map(feeds, &Task.async(fn -> refresh_feed(&1.id, &1.url) end))
    results = Enum.flat_map(tasks, &Task.await(&1))
    # IO.inspect(results)

    # TODO: Insert results to DB
  end

  def refresh_feed(feed_id, url) when is_binary(url) and is_integer(feed_id) do
    IO.puts("Refreshing feed: #{url}")
    %{body: body, status: status} = Req.get!(url)

    handle_feed(status, body, url)
  end

  def handle_feed(200, body, url) do
    # Awful hack to determine if it's an RSS feed or Atom feed
    # Consider using a proper XML library to parse the feed
    rss? = body |> String.slice(0..1000) |> String.contains?("<rss")

    if rss? do
      parse_rss_feed(url, body)
    else
      parse_atom_feed(url, body)
    end
  end

  def handle_feed(status, _, _) do
    IO.puts("HTTP status #{status} fetching feed")
    []
  end

  def parse_rss_feed(url, raw_feed) do
    with {:ok, feed} <- FastRSS.parse_rss(raw_feed) do
      items = Map.get(feed, "items")
      IO.puts("Done refreshing RSS feed #{url}. Processed #{Enum.count(items)} items")
      Enum.map(items, &parse_rss_item/1)
    else
      {:error, err} ->
        IO.inspect(err)
        IO.puts("Error parsing RSS feed: #{url}")
        []
    end
  end

  def parse_atom_feed(url, raw_feed) do
    with {:ok, feed} <- FastRSS.parse_atom(raw_feed) do
      items = Map.get(feed, "entries")
      IO.puts("Done refreshing Atom feed #{url}. Processed #{Enum.count(items)} items")
      Enum.map(items, &parse_atom_item/1)
    else
      {:error, err} ->
        IO.inspect(err)
        IO.puts("Error parsing Atom feed: #{url}")
        []
    end
  end

  def parse_rss_item(item) do
    with {:ok, published_at} <- get_published_at(item) do
      Item.changeset(%Item{}, %{
        title: Map.get(item, "title"),
        body: Map.get(item, "content"),
        published_at: published_at,
        url: Map.get(item, "link")
      })
    else
      {:error, _} ->
        IO.puts("No date found in item")
    end
  end

  def parse_atom_item(item) do
    with {:ok, published_at} <- get_published_at(item) do
      url = Map.get(item, "links") |> Enum.find(&(&1["rel"] == "alternate")) |> Map.get("href")

      Item.changeset(%Item{}, %{
        title: Map.get(item, "title") |> Map.get("value"),
        body: Map.get(item, "content") |> Map.get("value"),
        published_at: published_at,
        url: url
      })
    else
      {:error, _} ->
        IO.puts("No date found in item")
    end
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
        {:error, "Invalid date or date not found"}
    end
  end

  def parse_date(str) do
    formats = [
      "{ISO:Extended:Z}",
      "{RFC1123}"
    ]

    Enum.reduce(formats, nil, fn format, acc ->
      case Timex.parse(str, format) do
        {:ok, datetime} -> {:ok, datetime}
        _ -> acc
      end
    end)
  end
end
