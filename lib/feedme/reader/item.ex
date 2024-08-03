defmodule Feedme.Reader.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :title, :string
    field :body, :string
    field :feed_id, :id
    field :published_at, :utc_datetime
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :body, :published_at])
    |> validate_required([:title, :body, :published_at])
  end
end
