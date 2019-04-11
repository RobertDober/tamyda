defmodule TamydaWeb.TamydaLive.Search do

  defstruct [ desc: nil, query: nil, matches: [], selected_tags: [] ]

  @doc "Just remove __struct__ from the default struct"
  def default do
    %__MODULE__{} |> to_map()
  end

  @doc "Just remove __struct__ from given struct"
  def to_map(search) do
    search |> Map.delete( :__struct__ )
  end
  
end
