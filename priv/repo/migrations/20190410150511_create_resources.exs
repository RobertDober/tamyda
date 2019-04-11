defmodule Tamyda.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :short, :string
      add :long, :text
      add :url, :string

      timestamps()
    end

    create index(:resources, [:short])
  end
end
