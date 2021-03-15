defmodule KycApiWeb.UserInterestControllerTest do
  use KycApiWeb.ConnCase

  alias KycApi.Linker
  alias KycApi.Linker.UserInterest

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:user_interest) do
    {:ok, user_interest} = Linker.create_user_interest(@create_attrs)
    user_interest
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_interest", %{conn: conn} do
      conn = get(conn, Routes.user_interest_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_interest" do
    test "renders user_interest when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_interest_path(conn, :create), user_interest: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_interest_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_interest_path(conn, :create), user_interest: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_interest" do
    setup [:create_user_interest]

    test "renders user_interest when data is valid", %{conn: conn, user_interest: %UserInterest{id: id} = user_interest} do
      conn = put(conn, Routes.user_interest_path(conn, :update, user_interest), user_interest: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_interest_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_interest: user_interest} do
      conn = put(conn, Routes.user_interest_path(conn, :update, user_interest), user_interest: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_interest" do
    setup [:create_user_interest]

    test "deletes chosen user_interest", %{conn: conn, user_interest: user_interest} do
      conn = delete(conn, Routes.user_interest_path(conn, :delete, user_interest))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_interest_path(conn, :show, user_interest))
      end
    end
  end

  defp create_user_interest(_) do
    user_interest = fixture(:user_interest)
    {:ok, user_interest: user_interest}
  end
end
