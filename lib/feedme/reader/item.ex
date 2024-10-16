defmodule Feedme.Reader.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :title, :string
    field :body, :string
    field :url, :string
    field :feed_id, :id
    field :published_at, :utc_datetime
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :body, :url, :published_at, :feed_id])
    |> validate_required([:url, :published_at, :feed_id])
  end
end
