defmodule Elmnix.Repo do
  use Ecto.Repo, otp_app: :elmnix

  use Scrivener, page_size: 9
end
