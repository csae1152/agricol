defmodule Agricol.Prediction.Image do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :description, :string
    field :image, Agricol.Image.Type
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:image, :description, :name])
    |> validate_required([:image, :description, :name])
  end
end
