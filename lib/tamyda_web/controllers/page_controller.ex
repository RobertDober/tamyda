defmodule TamydaWeb.PageController do
  use TamydaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
