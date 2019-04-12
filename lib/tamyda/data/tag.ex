defmodule Tamyda.Data.Tag do

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Tamyda.Repo

  schema "tags" do
    field :tag, :string, null: false

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(tag, params) when is_list(params) do 
    tag
    |> changeset(params |> Enum.into(%{}))
  end
  def changeset(tag, params)  do 
    tag
    |> cast(params, [:tag])
    |> validate_required(:tag)
    |> force_lowercase(:tag)
    |> unique_constraint(:tag)
  end
  # def list_tags do
  #   names = ~w{alpha beta gamma delta epsilon zeta iota kappa}
  #   for {name, id} <-  Enum.zip(names, Stream.iterate(1, &(&1+1))) do
  #     struct(__MODULE__, id: id, tag: name)
  #   end
  # end

  def find_tags(query) do
    likeable_query = transform_query_string(query)
    query1 = from t in __MODULE__,
      where: ilike( t.tag, ^likeable_query),
      select: t.tag
    Repo.all(query1) 
  end

  defp force_lowercase(changeset, field) do 
    lower =
      changeset
      |> get_change(field)
      |> String.downcase
    changeset
    |> put_change(field, lower)
  end


  defp transform_query_string(query_string)
  defp transform_query_string("^" <> rest), do: _transform_qs("", rest, String.at(rest, -1))
  defp transform_query_string(rest), do: _transform_qs("%", rest, String.at(rest, -1))

  defp _transform_qs(start, rest, last)
  defp _transform_qs(start, rest, "$"), do: "#{start}#{String.slice(rest, 0..-2)}"
  defp _transform_qs(start, rest, _), do: "#{start}#{rest}%"

end
