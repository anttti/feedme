Mix.install([
  {:timex, "~> 3.0"},
  {:date_time_parser, "~> 1.2"}
])

defmodule Dates do
  def run() do
    IO.inspect(DateTimeParser.parse_datetime("2024-01-23T00:00:00Z"))
    IO.inspect(DateTimeParser.parse_datetime("2024-06-20T12:38:31.606+00:00"))
    IO.inspect(DateTimeParser.parse_datetime("Tue, 05 Mar 2013 23:25:19 +0200"))

    IO.inspect(Timex.parse("Tue, 05 Mar 2013 23:25:19 +0200", "{RFC1123}") |> Timex.to_datetime())
  end
end

Dates.run()
