defmodule KycApi.InterestctxTest do
  use KycApi.DataCase

  alias KycApi.Interestctx

  describe "interest" do
    alias KycApi.Interestctx.Interest

    @valid_attrs %{description: "some description", topic: "some topic"}
    @update_attrs %{description: "some updated description", topic: "some updated topic"}
    @invalid_attrs %{description: nil, topic: nil}

    def interest_fixture(attrs \\ %{}) do
      {:ok, interest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interestctx.create_interest()

      interest
    end

    test "list_interest/0 returns all interest" do
      interest = interest_fixture()
      assert Interestctx.list_interest() == [interest]
    end

    test "get_interest!/1 returns the interest with given id" do
      interest = interest_fixture()
      assert Interestctx.get_interest!(interest.id) == interest
    end

    test "create_interest/1 with valid data creates a interest" do
      assert {:ok, %Interest{} = interest} = Interestctx.create_interest(@valid_attrs)
      assert interest.description == "some description"
      assert interest.topic == "some topic"
    end

    test "create_interest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interestctx.create_interest(@invalid_attrs)
    end

    test "update_interest/2 with valid data updates the interest" do
      interest = interest_fixture()
      assert {:ok, %Interest{} = interest} = Interestctx.update_interest(interest, @update_attrs)
      assert interest.description == "some updated description"
      assert interest.topic == "some updated topic"
    end

    test "update_interest/2 with invalid data returns error changeset" do
      interest = interest_fixture()
      assert {:error, %Ecto.Changeset{}} = Interestctx.update_interest(interest, @invalid_attrs)
      assert interest == Interestctx.get_interest!(interest.id)
    end

    test "delete_interest/1 deletes the interest" do
      interest = interest_fixture()
      assert {:ok, %Interest{}} = Interestctx.delete_interest(interest)
      assert_raise Ecto.NoResultsError, fn -> Interestctx.get_interest!(interest.id) end
    end

    test "change_interest/1 returns a interest changeset" do
      interest = interest_fixture()
      assert %Ecto.Changeset{} = Interestctx.change_interest(interest)
    end
  end
end
