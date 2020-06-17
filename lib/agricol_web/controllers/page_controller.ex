defmodule AgricolWeb.PageController do
  use AgricolWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
