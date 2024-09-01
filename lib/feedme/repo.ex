defmodule Feedme.Repo do
  use Ecto.Repo,
    otp_app: :feedme,
    adapter: Ecto.Adapters.Postgres

  def insert_in_chunks(items, table, chunk_size \\ 1000) do
    Enum.chunk_every(items, chunk_size)
    |> Enum.map(fn chunk -> Repo.insert_all(table, chunk) end)
  end
end
