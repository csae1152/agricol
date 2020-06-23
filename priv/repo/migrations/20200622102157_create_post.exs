defmodule Agricol.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :title, :string
      add :content, :string
      add :is_published, :boolean, default: false, null: false

      timestamps()
    end

  end
end
