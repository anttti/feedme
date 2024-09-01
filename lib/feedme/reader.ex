# Atom spec: https://validator.w3.org/feed/docs/atom.html

defmodule Feedme.Reader do
  import Ecto.Query

  alias Feedme.Reader.Item
  alias Feedme.Reader.Feed
  alias Feedme.Repo

  import Feedme.FeedUtilsCommon
  import Feedme.FeedUtilsRSS
  import Feedme.FeedUtilsAtom

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

  defp insert_in_chunks(items) do
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

  defp handle_feed(200, :rss, body, id, url) do
    parse_rss_feed(id, url, body)
  end

  defp handle_feed(200, :atom, body, id, url) do
    parse_atom_feed(id, url, body)
  end

  defp handle_feed(status, _, _, id, url) do
    IO.puts("HTTP status #{status} fetching feed #{id}: #{url}")
    []
  end
end
