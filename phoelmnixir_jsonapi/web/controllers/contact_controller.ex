defmodule Elmnix.ContactController do
  use Elmnix.Web, :controller

  alias Elmnix.Contact

  def index(conn, params) do
    page = Contact
      |> order_by(:first_name)
      |> Repo.paginate(params)

      render conn, page: page
  end

end
