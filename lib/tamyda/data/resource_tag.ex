defmodule Tamyda.Data.ResourceTag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tamyda.Repo

  schema "resource_tags" do
    field :resource_id, :id
    field :tag_id, :id

    timestamps()
  end

  @doc false
  def changeset(resource_tag, attrs) do
    resource_tag
    |> cast(attrs, [:resource_id, :tag_id])
    |> validate_required([:resource_id, :tag_id])
  end

  @doc """
    Convenience function to add a tag to a resource
  """
  def add_tag_to_resource(tag, resource)
  def add_tag_to_resource(tag, resource) when is_number(tag) and is_number(resource), do:
    %__MODULE__{}
    |> changeset(%{tag_id: tag, resource_id: resource})
    |> Repo.insert
  def add_tag_to_resource(tag, resource) when is_number(tag), do:
    add_tag_to_resource(tag, resource.id)
  def add_tag_to_resource(tag, resource) when is_number(resource), do:
    add_tag_to_resource(tag.id, resource)
  def add_tag_to_resource(tag, resource), do:
    add_tag_to_resource(tag.id, resource.id)
 
end
