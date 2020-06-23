defmodule Agricol.Diagnostics.Retinal do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  schema "retinals" do
    field :description, :string
    field :retinaimage, Agricol.Retinalimages.Type
    field :timestamps, :string

    timestamps()
  end

  @doc false
  def changeset(retinal, attrs) do
    retinal
    |> cast(attrs, [:description, :retinaimage, :timestamps])
    |> validate_required([:retinaimage])
  end
end
