defmodule Tamyda.Data.Tag do
  
  defstruct [id: 0, tag: ""]

  def list_tags do
    names = ~w{alpha beta gamma delta epsilon zeta iota kappa}
    for {name, id} <-  Enum.zip(names, Stream.iterate(1, &(&1+1))) do
      struct(__MODULE__, id: id, tag: name)
    end
  end

  def find_tag(query) do
    case Regex.compile(query) do
      {:ok, q} -> list_tags() |> Enum.filter(&String.match?(&1.tag, q))
      _        -> []
    end
  end

  def find_tag_text(query), do: find_tag(query) |> Enum.map(&(&1.tag))
  
end
