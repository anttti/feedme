defmodule Feedme.Repo.Migrations.CreateFeeds do
  use Ecto.Migration

  def change do
    create table(:feeds) do
      add :title, :string
      add :url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
