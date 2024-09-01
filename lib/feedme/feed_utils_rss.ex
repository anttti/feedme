defmodule Feedme.FeedUtilsRSS do
  import Feedme.FeedUtilsCommon
  alias Feedme.Reader.Item

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

  def parse_rss_item(feed_id, item) do
    Item.changeset(%Item{}, %{
      title: Map.get(item, "title"),
      body: parse_body(item),
      published_at: get_published_at(item),
      url: Map.get(item, "link"),
      feed_id: feed_id
    })
  end
end
