defmodule Feedme.AtomFeedTest do
  use ExUnit.Case, async: true
  alias Feedme.Reader

  describe "parse_atom_feed/2" do
    test "parses Atom feed" do
      feed = File.read!("test/feedme/fixtures/atom.xml")
      parsed_feed = Reader.parse_atom_feed("https://dummy/feed.rss", feed)
      assert Enum.count(parsed_feed) == 1
    end

    test "parses Atom feed 2" do
      feed = File.read!("test/feedme/fixtures/atom2.xml")
      parsed_feed = Reader.parse_atom_feed("https://dummy/feed.rss", feed)

      assert Enum.count(parsed_feed) == 1

      assert Enum.at(parsed_feed, 0).changes.url ==
               "https://blog.separateconcerns.com/2024-08-30-thoughts-10.html"
    end
  end
end
