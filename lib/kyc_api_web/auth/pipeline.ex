defmodule KycApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :kyc_api,
    module: KycApiWeb.Auth.Guardian,
    error_handler: KycApiWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
