defmodule Tamyda.Data.ResourceTest do
  use Tamyda.DataCase

  alias Tamyda.Data, as: D

  describe "querying by tags" do
    alias Tamyda.Data.Resource, as: R

    defp fixtures do
      1..5 
      |> Enum.map(&resource_fixture/1)
      |> assign_tags()
      |> Enum.map(fn {:ok, res} -> res end)
    end

    #  Resource1 -> Tags 1, 2, 4, 5
    #  Resource2 -> Tags 2, 4
    #  Resource3 -> Tags 3
    #  Resource4 -> Tags 4
    #  Resource5 -> No Tags 
    defp assign_tags(resources) do
      resources
      |> assign_tags_to(1, [1, 2, 4, 5])
      |> assign_tags_to(2, [2, 4])
      |> assign_tags_to(3, [3])
      |> assign_tags_to(4, [4])
    end
    defp assign_tags_to(resources, rindex, tindices) do
      case Enum.at(resources, rindex - 1) do
        {:ok, %{id: id}} ->
          R.add_tags(id, tindices |> Enum.map(&("tag_#{&1}")))
      end
      resources
    end

    defp resource_fixture(n) do
      D.create_resource(%{short_desc: "short_#{n}", long_desc: "long_#{n}", url: "url_#{n}"})
    end

    test "all resources are here" do
      fixtures()
      assert 5 == D.list_resources |> Enum.count
      assert 5 == D.list_tags |> Enum.count
      assert 8 == D.list_resource_tags |> Enum.count
    end

    test "get resources which have tags 2 and 4" do
      [exp1, exp2 | _ ] = fixtures()
      [act1, act2] = R.with_tags( ~w{tag_2 tag4} )

      assert {exp1.id, exp2.id} == {act1.id, act2.id}
    end
  end
end
