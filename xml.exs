Mix.install([
  {:sweet_xml, "~> 0.7.1"}
])

defmodule XmlTest do
  import SweetXml

  def run() do
    {:ok, opml} = File.read("feeds.opml")

    urls = opml |> SweetXml.xpath(~x"//outline/@xmlUrl"l)
    titles = opml |> SweetXml.xpath(~x"//outline/@title"l)

    for {url, title} <- Enum.zip(urls, titles) do
      IO.puts(
        "INSERT INTO feeds (title, url, inserted_at, updated_at) VALUES ('#{title}', '#{url}', NOW(), NOW());"
      )
    end
  end
end

XmlTest.run()
