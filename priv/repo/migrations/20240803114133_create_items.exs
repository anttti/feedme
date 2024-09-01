defmodule Feedme.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :text
      add :body, :text
      add :url, :text, null: false
      add :feed_id, references(:feeds, on_delete: :delete_all)
      add :published_at, :utc_datetime, null: false
    end

    create index(:items, [:feed_id])
  end
end
