defmodule PhoelmnixirChat.PageController do
  use PhoelmnixirChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
