defmodule TwitterServerWeb.PageController do
  use TwitterServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
