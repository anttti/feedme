defmodule Feedme.Reader do
  def refresh_feeds() do
    url = "https://mjtsai.com/blog/feed/"
    raw_feed = Req.get!(url)
    # TODO: Follow redirects, validate that 2xx is returned
    {:ok, feed} = FastRSS.parse_rss(raw_feed.body)
    items = Map.get(feed, "items")
    IO.inspect(hd(items))
  end
end
