# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :machixir,
  ecto_repos: [Machixir.Repo]

# Configures the endpoint
config :machixir, MachixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OFxReERXpYLz6+fjA6bo6azqcBbVLJejOWmJNhkbE0BVwC9stzICIsvZo4Pih6pu",
  render_errors: [view: MachixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Machixir.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason
config :ecto, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
