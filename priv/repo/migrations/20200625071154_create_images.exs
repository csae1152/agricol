defmodule Agricol.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :image, :string
      add :description, :string
      add :name, :string

      timestamps()
    end

  end
end
