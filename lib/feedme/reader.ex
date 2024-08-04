defmodule Feedme.Reader do
  alias Feedme.Reader.Item
  alias Feedme.Repo

  # TODO
  #
  # Follow redirects, validate that 2xx is returned
  # Insert as bulk operation
  # Calculate MD5 hash for title + body to see if they're updated

  def refresh_feeds() do
    url = "https://mjtsai.com/blog/feed/"
    refresh_feed(url)
  end

  def refresh_feed(url) when is_binary(url) do
    raw_feed = Req.get!(url)
    {:ok, feed} = FastRSS.parse_rss(raw_feed.body)
    items = Map.get(feed, "items")
    handle_items(items)
  end

  def handle_items(items) do
    Enum.each(items, fn item ->
      item |> parse_item() |> Repo.insert()
    end)
  end

  def parse_item(item) do
    published_at = Timex.parse!(Map.get(item, "pub_date"), "{RFC1123}")

    Item.changeset(%Item{}, %{
      title: Map.get(item, "title"),
      body: Map.get(item, "content"),
      published_at: published_at,
      url: Map.get(item, "link")
    })
  end
end
