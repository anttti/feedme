defmodule Feedme.Reader.UserItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_items" do
    field :is_read, :boolean, default: false
    field :item_id, :id
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_item, attrs) do
    user_item
    |> cast(attrs, [:is_read])
    |> validate_required([:is_read])
  end
end
