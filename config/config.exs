# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tamyda,
  ecto_repos: [Tamyda.Repo]

# Configures the endpoint
config :tamyda, TamydaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AQhhnEOZzkz3J/ayeoVIWB66EcCqi5KNTlSub1zwr0ru3lc3iZF/T39XGkWaltfZ",
  render_errors: [view: TamydaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tamyda.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "7PrMCCTgEhZjnavOFTrCpv8obSUNqKOl2NI3Vd9gG0IXpvUwZ0U4TtM4qvoMofJp"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
