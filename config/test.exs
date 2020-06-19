use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :agricol, Agricol.Repo,
adapter: Ecto.Adapters.Postgres,
url: {:system, "DATABASE_URL"},
pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :agricol, AgricolWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
