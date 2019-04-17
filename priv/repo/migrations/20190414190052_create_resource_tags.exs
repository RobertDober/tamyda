defmodule Tamyda.Repo.Migrations.CreateResourceTags do
  use Ecto.Migration

  def change do
    create table(:resource_tags) do
      add :resource_id, references(:resources, on_delete: :nothing), null: false
      add :tag_id, references(:tags, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:resource_tags, [:resource_id])
    create index(:resource_tags, [:tag_id])
    create unique_index(:resource_tags, [:resource_id, :tag_id])
  end
end
