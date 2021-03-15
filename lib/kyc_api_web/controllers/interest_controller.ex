defmodule KycApiWeb.InterestController do
  use KycApiWeb, :controller

  alias KycApi.Interestctx
  alias KycApi.Interestctx.Interest

  action_fallback KycApiWeb.FallbackController

  def index(conn, _params) do
    interest = Interestctx.list_interest()
    render(conn, "index.json", interest: interest)
  end

  def create(conn, %{"interest" => interest_params}) do
    with {:ok, %Interest{} = interest} <- Interestctx.create_interest(interest_params) do
      conn
      |> put_status(:created)
      |> render("show.json", interest: interest)
    end
  end

  def show(conn, %{"id" => id}) do
    interest = Interestctx.get_interest!(id)
    render(conn, "show.json", interest: interest)
  end

  def update(conn, %{"id" => id, "interest" => interest_params}) do
    interest = Interestctx.get_interest!(id)

    with {:ok, %Interest{} = interest} <- Interestctx.update_interest(interest, interest_params) do
      render(conn, "show.json", interest: interest)
    end
  end

  def delete(conn, %{"id" => id}) do
    interest = Interestctx.get_interest!(id)

    with {:ok, %Interest{}} <- Interestctx.delete_interest(interest) do
      send_resp(conn, :no_content, "")
    end
  end
end
