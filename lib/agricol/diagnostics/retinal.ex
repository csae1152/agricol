defmodule Agricol.Diagnostics.Retinal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "retinals" do
    field :description, :string
    field :retinaimage, :binary
    field :timestamps, :string

    timestamps()
  end

  @doc false
  def changeset(retinal, attrs) do
    retinal
    |> cast(attrs, [:description, :retinaimage, :timestamps])
    |> validate_required([:description, :retinaimage, :timestamps])
  end
end
