defmodule Feedme.FeedUtilsCommonTest do
  use ExUnit.Case, async: true
  alias Feedme.FeedUtilsCommon

  describe "get_published_at/1" do
    test "parses ISO Extended Z date correctly from key updated" do
      item = %{
        "updated" => "2024-01-23T00:00:00Z"
      }

      published_at = FeedUtilsCommon.get_published_at(item)

      assert published_at == Timex.parse!("2024-01-23T00:00:00Z", "{ISO:Extended:Z}")
    end

    test "parses ISO Extended Z date correctly from key published" do
      item = %{
        "published" => "2024-01-23T00:00:00Z"
      }

      published_at = FeedUtilsCommon.get_published_at(item)

      assert published_at == Timex.parse!("2024-01-23T00:00:00Z", "{ISO:Extended:Z}")
    end

    test "parses RFC1123 date correctly from key published" do
      item = %{
        "published" => "Tue, 05 Mar 2013 23:25:19 +0200"
      }

      published_at = FeedUtilsCommon.get_published_at(item)

      assert published_at == Timex.parse!("Tue, 05 Mar 2013 23:25:19 +0200", "{RFC1123}")
    end
  end

  describe "parse_date/1" do
    test "parses ISO Extended Z date correctly" do
      date = "2024-01-23T00:00:00Z"
      assert FeedUtilsCommon.parse_date(date) == Timex.parse!(date, "{ISO:Extended:Z}")
    end

    test "parses ISO Extended Z date correctly 2" do
      date = "2024-06-20T12:38:31.606+00:00"
      assert FeedUtilsCommon.parse_date(date) == Timex.parse!(date, "{ISO:Extended:Z}")
    end

    test "parses RFC1123 date correctly" do
      date = "Tue, 05 Mar 2013 23:25:19 +0200"
      assert FeedUtilsCommon.parse_date(date) == Timex.parse!(date, "{RFC1123}")
    end
  end

  describe "detect_type/1" do
    test "returns :rss for an RSS feed" do
      feed = File.read!("test/feedme/fixtures/rss2.xml")
      assert FeedUtilsCommon.detect_type(feed) == :rss
      feed = File.read!("test/feedme/fixtures/rss3.xml")
      assert FeedUtilsCommon.detect_type(feed) == :rss
      feed = File.read!("test/feedme/fixtures/rss4.xml")
      assert FeedUtilsCommon.detect_type(feed) == :rss
    end

    test "returns :atom for an Atom feed" do
      feed = File.read!("test/feedme/fixtures/atom.xml")
      assert FeedUtilsCommon.detect_type(feed) == :atom
      feed = File.read!("test/feedme/fixtures/atom2.xml")
      assert FeedUtilsCommon.detect_type(feed) == :atom
    end
  end

  @item %{
    "author" => nil,
    "categories" => [],
    "comments" => nil,
    "content" => nil,
    "description" => nil,
    "dublin_core_ext" => nil,
    "enclosure" => nil,
    "extensions" => %{},
    "guid" => %{
      "permalink" => true,
      "value" => "https://www.stavros.io/posts/making-the-strofara/"
    },
    "itunes_ext" => nil,
    "link" => "https://www.stavros.io/posts/making-the-strofara/",
    "pub_date" => "Sun, 11 Aug 2024 16:14:27 +0000",
    "source" => nil,
    "title" => "This is the title",
    "summary" => nil
  }

  describe "parse_body/1" do
    test "should parse body from content" do
      item = %{@item | "content" => "This is the body"}
      assert FeedUtilsCommon.parse_body(item) == "This is the body"
    end

    test "should parse body from description" do
      item = %{@item | "description" => "Description"}
      assert FeedUtilsCommon.parse_body(item) == "Description"
    end

    test "should parse body from summary" do
      item = %{@item | "summary" => "Summary"}
      assert FeedUtilsCommon.parse_body(item) == "Summary"
    end
  end
end
