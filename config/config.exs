# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :machixir,
  ecto_repos: [Machixir.Repo]

# Configures the endpoint
config :machixir, MachixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I4xsykdkCHAlz+aG9tgPV0rH6w1R3q7jjiAFSPNzJpfqBgbJXLEQztkxBEfn5QdC",
  render_errors: [view: MachixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Machixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
