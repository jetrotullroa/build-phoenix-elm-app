# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elmnix,
  ecto_repos: [Elmnix.Repo]

# Configures the endpoint
config :elmnix, Elmnix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wUG7Cfi3heKC+W53863ohZPLhLRYdZDs9NHbeQn8Ft7BPj/vc+Psljqulx1ClvbS",
  render_errors: [view: Elmnix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elmnix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
