defmodule Feedme.FeedUtilsAtom do
  import Feedme.FeedUtilsCommon
  alias Feedme.Reader.Item

  def parse_atom_feed(feed_id, url, raw_feed) do
    with {:ok, feed} <- FastRSS.parse_atom(raw_feed) do
      items = Map.get(feed, "entries")
      Enum.map(items, fn item -> parse_atom_item(feed_id, item) end)
    else
      err ->
        IO.inspect(err)
        IO.puts("Error parsing Atom feed #{url}")
        []
    end
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
end
