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
end
