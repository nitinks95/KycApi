defmodule KycApi.LinkerTest do
  use KycApi.DataCase

  alias KycApi.Linker

  describe "user_interest" do
    alias KycApi.Linker.UserInterest

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_interest_fixture(attrs \\ %{}) do
      {:ok, user_interest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Linker.create_user_interest()

      user_interest
    end

    test "list_user_interest/0 returns all user_interest" do
      user_interest = user_interest_fixture()
      assert Linker.list_user_interest() == [user_interest]
    end

    test "get_user_interest!/1 returns the user_interest with given id" do
      user_interest = user_interest_fixture()
      assert Linker.get_user_interest!(user_interest.id) == user_interest
    end

    test "create_user_interest/1 with valid data creates a user_interest" do
      assert {:ok, %UserInterest{} = user_interest} = Linker.create_user_interest(@valid_attrs)
    end

    test "create_user_interest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Linker.create_user_interest(@invalid_attrs)
    end

    test "update_user_interest/2 with valid data updates the user_interest" do
      user_interest = user_interest_fixture()
      assert {:ok, %UserInterest{} = user_interest} = Linker.update_user_interest(user_interest, @update_attrs)
    end

    test "update_user_interest/2 with invalid data returns error changeset" do
      user_interest = user_interest_fixture()
      assert {:error, %Ecto.Changeset{}} = Linker.update_user_interest(user_interest, @invalid_attrs)
      assert user_interest == Linker.get_user_interest!(user_interest.id)
    end

    test "delete_user_interest/1 deletes the user_interest" do
      user_interest = user_interest_fixture()
      assert {:ok, %UserInterest{}} = Linker.delete_user_interest(user_interest)
      assert_raise Ecto.NoResultsError, fn -> Linker.get_user_interest!(user_interest.id) end
    end

    test "change_user_interest/1 returns a user_interest changeset" do
      user_interest = user_interest_fixture()
      assert %Ecto.Changeset{} = Linker.change_user_interest(user_interest)
    end
  end
end
