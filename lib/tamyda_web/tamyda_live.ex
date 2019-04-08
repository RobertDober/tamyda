defmodule TamydaWeb.TamydaLive do

  use Phoenix.LiveView
  alias Tamyda.Data.Tag

  def mount(_session, socket) do
    {:ok, assign(socket, query: nil, result: nil, loading: false, matches: [], selected_tags: ["hello"])}
  end

  def render(assigns) do
    TamydaWeb.TamydaView.render("index.html", assigns)
  end

  def handle_event("suggest", %{"q" => q}, socket) do
    if String.length(q) < 0 do
      {:noreply, assign(socket, query: q, result: "…", loading: true, matches: [])}
    else
      {:noreply, assign(socket, matches: Tag.find_tag_text(q))}
    end
  end

  def handle_event("search", %{"q" => q}, socket) do
    tags = Tag.find_tag_text(q)
    IO.inspect(tags)
    result = List.first(tags) || "???"
    {:noreply, assign(socket, query: q, result: result, loading: false, matches: [], selected_tags: tags)}
  end

  # def handle_info({:search, query}, socket) do
  #   {result, _} = System.cmd("dict", ["#{query}"], stderr_to_stdout: true)
  #   {:noreply, assign(socket, loading: false, result: result, matches: [])}
  # end
end
