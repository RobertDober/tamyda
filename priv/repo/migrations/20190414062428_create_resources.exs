defmodule Tamyda.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :short_desc, :string, null: false
      add :url, :string
      add :long_desc, :text

      timestamps()
    end

    create index(:resources, [:short_desc])
  end
end
