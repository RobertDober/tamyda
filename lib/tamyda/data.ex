defmodule Tamyda.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias Tamyda.Repo

  alias Tamyda.Data.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{source: %Tag{}}

  """
  def change_tag(%Tag{} = tag) do
    Tag.changeset(tag, %{})
  end

  @doc false
  def find_tags(query) do
    likeable_query = transform_query_string(query)
    query1 = from t in Tag,
      where: ilike( t.tag, ^likeable_query),
      select: t.tag
    Repo.all(query1) 
  end

  defp transform_query_string(query_string)
  defp transform_query_string("^" <> rest), do: _transform_qs("", rest, String.at(rest, -1))
  defp transform_query_string(rest), do: _transform_qs("%", rest, String.at(rest, -1))

  defp _transform_qs(start, rest, last)
  defp _transform_qs(start, rest, "$"), do: "#{start}#{String.slice(rest, 0..-2)}"
  defp _transform_qs(start, rest, _), do: "#{start}#{rest}%"


  alias Tamyda.Data.Resource

  @doc """
  Returns the list of resources.

  ## Examples

      iex> list_resources()
      [%Resource{}, ...]

  """
  def list_resources do
    Repo.all(Resource)
  end

  @doc """
  Gets a single resource.

  Raises `Ecto.NoResultsError` if the Resource does not exist.

  ## Examples

      iex> get_resource!(123)
      %Resource{}

      iex> get_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource!(id), do: Repo.get!(Resource, id)

  @doc """
  Creates a resource.

  ## Examples

      iex> create_resource(%{field: value})
      {:ok, %Resource{}}

      iex> create_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource(attrs \\ %{}) do
    %Resource{}
    |> Resource.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource.

  ## Examples

      iex> update_resource(resource, %{field: new_value})
      {:ok, %Resource{}}

      iex> update_resource(resource, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource(%Resource{} = resource, attrs) do
    resource
    |> Resource.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Resource.

  ## Examples

      iex> delete_resource(resource)
      {:ok, %Resource{}}

      iex> delete_resource(resource)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource(%Resource{} = resource) do
    Repo.delete(resource)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource changes.

  ## Examples

      iex> change_resource(resource)
      %Ecto.Changeset{source: %Resource{}}

  """
  def change_resource(%Resource{} = resource) do
    Resource.changeset(resource, %{})
  end

  alias Tamyda.Data.ResourceTag

  @doc """
  Returns the list of resource_tags.

  ## Examples

      iex> list_resource_tags()
      [%ResourceTag{}, ...]

  """
  def list_resource_tags do
    Repo.all(ResourceTag)
  end

  @doc """
  Gets a single resource_tag.

  Raises `Ecto.NoResultsError` if the Resource tag does not exist.

  ## Examples

      iex> get_resource_tag!(123)
      %ResourceTag{}

      iex> get_resource_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource_tag!(id), do: Repo.get!(ResourceTag, id)

  @doc """
  Creates a resource_tag.

  ## Examples

      iex> create_resource_tag(%{field: value})
      {:ok, %ResourceTag{}}

      iex> create_resource_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource_tag(attrs \\ %{}) do
    %ResourceTag{}
    |> ResourceTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource_tag.

  ## Examples

      iex> update_resource_tag(resource_tag, %{field: new_value})
      {:ok, %ResourceTag{}}

      iex> update_resource_tag(resource_tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource_tag(%ResourceTag{} = resource_tag, attrs) do
    resource_tag
    |> ResourceTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ResourceTag.

  ## Examples

      iex> delete_resource_tag(resource_tag)
      {:ok, %ResourceTag{}}

      iex> delete_resource_tag(resource_tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource_tag(%ResourceTag{} = resource_tag) do
    Repo.delete(resource_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource_tag changes.

  ## Examples

      iex> change_resource_tag(resource_tag)
      %Ecto.Changeset{source: %ResourceTag{}}

  """
  def change_resource_tag(%ResourceTag{} = resource_tag) do
    ResourceTag.changeset(resource_tag, %{})
  end
end
