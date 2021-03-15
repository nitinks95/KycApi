defmodule KycApi.Repo do
  use Ecto.Repo,
    otp_app: :kyc_api,
    adapter: Ecto.Adapters.Postgres
end
