# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :agricol,
  ecto_repos: [Agricol.Repo]

# Configures the endpoint
config :agricol, AgricolWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FbzTZEyAKETh+uIT/rfHYKVQaYkW/Fv0oAzXmnQgaCt8AbvmSnarJ3Zhw10T+825",
  render_errors: [view: AgricolWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Agricol.PubSub,
  live_view: [signing_salt: "Nk0dqGtC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#torch
config :torch,
  otp_app: :my_app_name,
  template_format: "eex" || "slime"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
