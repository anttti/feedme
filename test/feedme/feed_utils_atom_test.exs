defmodule Feedme.FeedUtilsAtomTest do
  use ExUnit.Case, async: true
  alias Feedme.FeedUtilsAtom

  describe "parse_atom_feed/2" do
    test "should parse Atom feed" do
      feed = File.read!("test/feedme/fixtures/atom.xml")
      parsed_feed = FeedUtilsAtom.parse_atom_feed("1", "https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end

    test "should parse Atom feed 2" do
      feed = File.read!("test/feedme/fixtures/atom2.xml")
      parsed_feed = FeedUtilsAtom.parse_atom_feed("1", "https://dummy/feed.rss", feed)

      assert Enum.count(parsed_feed) == 1

      assert Enum.at(parsed_feed, 0).changes.url ==
               "https://blog.separateconcerns.com/2024-08-30-thoughts-10.html"
    end

    test "should return 0 results from an invalid Atom feed" do
      feed = File.read!("test/feedme/fixtures/invalid.xml")
      parsed_feed = FeedUtilsAtom.parse_atom_feed("1", "https://dummy/feed.rss", feed)

      assert Enum.count(parsed_feed) == 0
    end
  end
end
