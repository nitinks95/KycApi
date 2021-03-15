defmodule KycApiWeb.UserInterestController do
  use KycApiWeb, :controller

  alias KycApi.Linker
  alias KycApi.Linker.UserInterest

  action_fallback KycApiWeb.FallbackController

  def index(conn, _params) do
    user_interest = Linker.list_user_interest()
    render(conn, "index.json", user_interest: user_interest)
  end

  def create(conn, %{"user_interest" => user_interest_params}) do
    with {:ok, %UserInterest{} = user_interest} <- Linker.create_user_interest(user_interest_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user_interest: user_interest)
    end
  end

  def show(conn, %{"id" => id}) do
    user_interest = Linker.get_user_interest!(id)
    render(conn, "show.json", user_interest: user_interest)
  end

  def update(conn, %{"id" => id, "user_interest" => user_interest_params}) do
    user_interest = Linker.get_user_interest!(id)

    with {:ok, %UserInterest{} = user_interest} <- Linker.update_user_interest(user_interest, user_interest_params) do
      render(conn, "show.json", user_interest: user_interest)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_interest = Linker.get_user_interest!(id)

    with {:ok, %UserInterest{}} <- Linker.delete_user_interest(user_interest) do
      send_resp(conn, :no_content, "")
    end
  end
end
