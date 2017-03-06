# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoelmnixir_chat,
  ecto_repos: [PhoelmnixirChat.Repo]

# Configures the endpoint
config :phoelmnixir_chat, PhoelmnixirChat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "627KBa4C5sjMtYZm86v6DEbMmv0Ay90H87Xs+48S8v/t4yVwQjmY62pQXuFa3Geh",
  render_errors: [view: PhoelmnixirChat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoelmnixirChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
