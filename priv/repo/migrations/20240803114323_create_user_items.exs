defmodule Feedme.Repo.Migrations.CreateUserItems do
  use Ecto.Migration

  def change do
    create table(:user_items) do
      add :is_read, :boolean, default: false, null: false
      add :item_id, references(:feeds, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:user_items, [:item_id])
    create index(:user_items, [:user_id])
  end
end
