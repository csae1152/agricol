defmodule Agricol.Content.Retina do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post" do
    field :content, :string
    field :is_published, :boolean, default: false
    field :title, :string

    timestamps()
  end
  @doc false
  def changeset(retina, attrs) do
    retina
    |> cast(attrs, [:title, :content, :is_published])
    |> validate_required([:title, :content, :is_published])
  end
end
