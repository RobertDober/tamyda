defmodule Tamyda.Data.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Tamyda.Repo
  use Repo.Tools

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

  @doc """
  Find or create a Tag by it's tag
  """
  def find_or_create(tag) do
    case find_tag(tag) do
      nil -> create_tag!(tag)
      id -> id
    end
  end

  defp create_tag!(tag) do
    case struct(__MODULE__)
               |> changeset(%{tag: tag})
               |> Repo.insert(log: false) do
      {:ok, inserted} -> inserted.id
      {:error, message} -> IO.inspect(message); raise "Abandoning seed"
    end
  end

  def find_tag(tag) do
    from( t in __MODULE__,
      where: ilike(t.tag, ^tag),
      select: t.id
    ) |> Repo.one
  end
end
