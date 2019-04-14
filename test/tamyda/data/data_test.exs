defmodule Tamyda.DataTest do
  use Tamyda.DataCase

  alias Tamyda.Data

  describe "tags" do
    alias Tamyda.Data.Tag

    @valid_attrs %{tag: "some tag"}
    @update_attrs %{tag: "some updated tag"}
    @invalid_attrs %{tag: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Data.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Data.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Data.create_tag(@valid_attrs)
      assert tag.tag == "some tag"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Data.update_tag(tag, @update_attrs)
      assert tag.tag == "some updated tag"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_tag(tag, @invalid_attrs)
      assert tag == Data.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Data.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Data.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Data.change_tag(tag)
    end
  end

  describe "resources" do
    alias Tamyda.Data.Resource

    @valid_attrs %{long_desc: "some long_desc", short_desc: "some short_desc", url: "some url"}
    @update_attrs %{long_desc: "some updated long_desc", short_desc: "some updated short_desc", url: "some updated url"}
    @invalid_attrs %{long_desc: nil, short_desc: nil, url: nil}

    def resource_fixture(attrs \\ %{}) do
      {:ok, resource} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_resource()

      resource
    end

    test "list_resources/0 returns all resources" do
      resource = resource_fixture()
      assert Data.list_resources() == [resource]
    end

    test "get_resource!/1 returns the resource with given id" do
      resource = resource_fixture()
      assert Data.get_resource!(resource.id) == resource
    end

    test "create_resource/1 with valid data creates a resource" do
      assert {:ok, %Resource{} = resource} = Data.create_resource(@valid_attrs)
      assert resource.long_desc == "some long_desc"
      assert resource.short_desc == "some short_desc"
      assert resource.url == "some url"
    end

    test "create_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_resource(@invalid_attrs)
    end

    test "update_resource/2 with valid data updates the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{} = resource} = Data.update_resource(resource, @update_attrs)
      assert resource.long_desc == "some updated long_desc"
      assert resource.short_desc == "some updated short_desc"
      assert resource.url == "some updated url"
    end

    test "update_resource/2 with invalid data returns error changeset" do
      resource = resource_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_resource(resource, @invalid_attrs)
      assert resource == Data.get_resource!(resource.id)
    end

    test "delete_resource/1 deletes the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{}} = Data.delete_resource(resource)
      assert_raise Ecto.NoResultsError, fn -> Data.get_resource!(resource.id) end
    end

    test "change_resource/1 returns a resource changeset" do
      resource = resource_fixture()
      assert %Ecto.Changeset{} = Data.change_resource(resource)
    end
  end
end
