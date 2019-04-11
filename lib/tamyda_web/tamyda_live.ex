defmodule TamydaWeb.TamydaLive do

  use Phoenix.LiveView
  alias Tamyda.Data.Tag
  alias TamydaWeb.TamydaLive.Search, as: S

  def mount(_session, socket) do
    IO.inspect socket
    {:ok, assign(socket, S.default)}
  end

  def render(assigns) do
    TamydaWeb.TamydaView.render("index.html", assigns)
  end

  def handle_event("suggest", %{"q" => q}, socket) do
    IO.inspect {:suggest, q, socket.assigns}
    if String.length(q) < 2 do
      {:noreply, assign(socket, query: q, result: "…", matches: [])}
    else
      {:noreply, assign(socket, matches: Tag.find_tags(q))}
    end
  end

  def handle_event("search", %{"q" => q, "desc" => desc}, %{assigns: %{selected_tags: selected_tags}} = socket) do
    IO.inspect {:search, q, desc, socket.assigns}
    tags = Tag.find_tags(q) ++ selected_tags |> Enum.uniq
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
