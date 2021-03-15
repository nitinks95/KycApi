use Mix.Config

# Configure your database
config :kyc_api, KycApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "kyc_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kyc_api, KycApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
