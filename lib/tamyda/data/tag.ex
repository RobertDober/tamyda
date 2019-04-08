defmodule Tamyda.Data.Tag do
  
  defstruct [tag: ""]

  def list_tags do
    for tag <- ~w{alpha beta gamma},
      do: struct(__MODULE__, tag: tag)
  end

  def find_tag(query) do
    case Regex.compile(query) do
      {:ok, q} -> list_tags() |> Enum.filter(&String.match?(&1.tag, q))
      _        -> []
    end
  end

  def find_tag_text(query), do: find_tag(query) |> Enum.map(&(&1.tag))
  
end
