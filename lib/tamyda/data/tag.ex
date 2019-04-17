defmodule Tamyda.Data.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  use Tamyda.Repo.Tools

  schema "tags" do
    field :tag, :string

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:tag])
    |> validate_required([:tag])
    |> update_change(:tag, &String.downcase/1)
    |> unique_constraint(:tag)
  end
end
