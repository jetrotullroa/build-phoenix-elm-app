use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :elmnix, Elmnix.Endpoint,
  secret_key_base: "sxg86HQA2lTJOQiwZN7lgLurCVr1g1ZVLBN5uDoMFl1zYOQNt7TvH0w7OpSz6MoT"

# Configure your database
config :elmnix, Elmnix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elmnix_prod",
  pool_size: 20
