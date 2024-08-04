defmodule Feedme.Reader do
  alias Feedme.Reader.Item
  alias Feedme.Reader.Feed
  alias Feedme.Repo

  # TODO
  #
  # Follow redirects, validate that 2xx is returned
  # Insert as bulk operation
  # Calculate MD5 hash for title + body to see if they're updated

  def refresh_feeds() do
    feeds = Repo.all(Feed)

    Enum.each(feeds, fn feed ->
      Task.start(fn -> refresh_feed(feed.id, feed.url) end)
    end)
  end

  def refresh_feed(feed_id, url) when is_binary(url) and is_integer(feed_id) do
    IO.puts("Refreshing feed: #{url}")
    raw_feed = Req.get!(url)

    with {:ok, feed} <- FastRSS.parse_rss(raw_feed.body) do
      items = Map.get(feed, "items")
      handle_items(items)
      IO.puts("Done refreshing feed: #{url}")
    else
      {:error, _} ->
        IO.puts("Error parsing feed: #{url}")
    end
  end

  def handle_items(items) do
    Enum.each(items, fn item ->
      item |> parse_item |> persist_item
    end)
  end

  def persist_item(nil), do: nil

  def persist_item(item) do
    Repo.insert(item)
  end

  def parse_item(item) do
    with {:ok, published_at} <- Timex.parse(Map.get(item, "pub_date"), "{RFC1123}") do
      Item.changeset(%Item{}, %{
        title: Map.get(item, "title"),
        body: Map.get(item, "content"),
        published_at: published_at,
        url: Map.get(item, "link")
      })
    else
      {:error, _} -> IO.puts("Error parsing date: #{Map.get(item, "pub_date")}")
    end
  end
end
