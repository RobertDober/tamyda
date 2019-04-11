defmodule Tamyda.Data.Resource do

  use Ecto.Schema
  import Ecto.Changeset

  schema "resources" do
    field :short, :string
    field :long, :string
    field :url, :string

    timestamps()
  end
  
end
