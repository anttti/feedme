# Feedme

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Deps

- [`Req`](https://hexdocs.pm/req/readme.html) as the HTTP client
- [`FastRSS`](https://hexdocs.pm/fast_rss/readme.html) as the RSS parser

## Running tests

Currently tests need to be run with max-cases 1, otherwise the SQLite DB
gets angry due to multiple concurrent access attempts.

`mix test.watch --stale --max-cases 1`
