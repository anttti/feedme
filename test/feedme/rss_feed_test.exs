defmodule Feedme.AtomFeedTest do
  use ExUnit.Case, async: true
  alias Feedme.Reader

  describe "parse_rss_feed/2" do
    test "parses RSS feed" do
      feed = File.read!("test/feedme/fixtures/no_body.xml")
      {:ok, parsed_feed} = Reader.parse_rss_feed("https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end

    test "parses RSS feed 2" do
      feed = File.read!("test/feedme/fixtures/rss2.xml")
      {:ok, parsed_feed} = Reader.parse_rss_feed("https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end

    test "parses RSS feed 3" do
      feed = File.read!("test/feedme/fixtures/rss3.xml")
      {:ok, parsed_feed} = Reader.parse_rss_feed("https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end

    test "parses RSS feed 4" do
      feed = File.read!("test/feedme/fixtures/rss4.xml")
      {:ok, parsed_feed} = Reader.parse_rss_feed("https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end

    test "parses RSS feed 5" do
      feed = File.read!("test/feedme/fixtures/no_published_date.xml")
      {:ok, parsed_feed} = Reader.parse_rss_feed("https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end

    test "parses RSS feed 6" do
      feed = File.read!("test/feedme/fixtures/steve.xml")
      {:ok, parsed_feed} = Reader.parse_rss_feed("https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end
  end
end
