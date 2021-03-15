# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kyc_api,
  ecto_repos: [KycApi.Repo]

# Configures the endpoint
config :kyc_api, KycApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UqQQeY7ABD4CnDT0DG0Ogmv7HOT7aS09WhE8JxkGJhv3LFxCFqESV1tZhTqK0RFK",
  render_errors: [view: KycApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: KycApi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "/9gVShv4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configuration for JWT token for authentication
config :kyc_api, KycApiWeb.Auth.Guardian,
  issuer: "kyc_api",
  secret_key: "GXBQseG14gVLZymYvy3fxEsIxX/zrLa0zbiXQTXLc4daMyJ9jRAY279Km3eVSUhV"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
