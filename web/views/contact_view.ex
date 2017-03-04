defmodule Elmnix.ContactView do
  use Elmnix.Web, :view

  def render("index.json", %{page: page}), do: page

end
