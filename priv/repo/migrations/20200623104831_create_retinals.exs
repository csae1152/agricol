defmodule Agricol.Repo.Migrations.CreateRetinals do
  use Ecto.Migration

  def change do
    create table(:retinals) do
      add :description, :string
      add :retinaimage, :binary
      add :timestamps, :string

      timestamps()
    end

  end
end
