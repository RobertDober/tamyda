defmodule Tamyda.Data.Resource do
  use Ecto.Schema
  import Ecto.Changeset

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

end
