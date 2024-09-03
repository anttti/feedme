defmodule Feedme.FeedUtilsCommon do
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
    with nil <- Map.get(item, "content"),
         nil <- Map.get(item, "summary"),
         nil <- Map.get(item, "description") do
      ""
    else
      content ->
        # Sometimes the body is a map with a "value" key, other times it's just a string
        cond do
          is_map(content) -> Map.get(content, "value")
          true -> content
        end
    end
  end
end
