defmodule Elmnix.PageController do
  use Elmnix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
