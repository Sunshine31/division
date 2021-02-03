# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :division,
  ecto_repos: [Division.Repo]

# Configures the endpoint
config :division, DivisionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fMoi9M19xJO8XGx5FlidixlQ/T+V3pTURZiAZQYZoOnUIj1LkrD5jJO7gulwK35i",
  render_errors: [view: DivisionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Division.PubSub,
  live_view: [signing_salt: "3ZELnyJ4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
