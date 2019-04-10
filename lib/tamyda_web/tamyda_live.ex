defmodule TamydaWeb.TamydaLive do

  use Phoenix.LiveView
  alias Tamyda.Data.Tag

  def mount(_session, socket) do
    IO.inspect socket
    {:ok, assign(socket, query: nil, matches: [], result: "", selected_tags: [])}
  end

  def render(assigns) do
    TamydaWeb.TamydaView.render("index.html", assigns)
  end

  def handle_event("suggest", %{"q" => q}, socket) do
    IO.inspect {:suggest, q, socket.assigns}
    if String.length(q) < 2 do
      {:noreply, assign(socket, query: q, result: "…", matches: [])}
    else
      {:noreply, assign(socket, matches: Tag.find_tag_text(q))}
    end
  end

  def handle_event("search", %{"q" => q}, %{assigns: %{selected_tags: selected_tags}} = socket) do
    IO.inspect {:search, q, selected_tags}
    tags = Tag.find_tag_text(q) ++ selected_tags |> Enum.uniq
    result = ""
    {:noreply, assign(socket, query: q, result: result, matches: [], selected_tags: tags)}
  end

  def handle_event("remove-tag", value, %{assigns: %{selected_tags: selected_tags}} = socket) do
    new_tags = selected_tags |> List.delete(value) |> IO.inspect
    {:noreply, assign(socket, selected_tags: new_tags)}
  end
  # def handle_info({:search, query}, socket) do
  #   {result, _} = System.cmd("dict", ["#{query}"], stderr_to_stdout: true)
  #   {:noreply, assign(socket, result: result, matches: [])}
  # end
end
