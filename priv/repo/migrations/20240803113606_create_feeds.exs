defmodule Feedme.Repo.Migrations.CreateFeeds do
  use Ecto.Migration

  def change do
    create table(:feeds) do
      add :title, :text, null: false
      add :url, :text, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
