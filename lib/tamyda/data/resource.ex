defmodule Tamyda.Data.Resource do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tamyda.Data.ResourceTag
  alias Tamyda.Data.Tag

  use Tamyda.Repo.Tools

  schema "resources" do
    field :long_desc, :string
    field :short_desc, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(resource, attrs) do
    resource
    |> cast(attrs, [:short_desc, :url, :long_desc])
    |> validate_required([:short_desc])
  end

  def create_with_tags(tags, atts) do
    case create(atts) do
      {:ok, resource} -> add_tags(resource.id, tags); {:ok, resource}
      error           -> error
    end
  end

  def add_tags(resource_id, tags) do
    tags
    |> Enum.each( &ResourceTag.add_tag_to_resource(Tag.find_or_create(&1), resource_id) )
  end
end
