defmodule KycApi.Linker.UserInterest do
  use Ecto.Schema
  import Ecto.Changeset

  @already_exists "ALREADY_EXISTS"

  alias KycApi.Interestctx.Interest
  alias KycApi.Accounts.User

  schema "user_interest" do
    belongs_to(:user, User)
    belongs_to(:interest, Interest)
  end

  @all_fields ~w(user_id interest_id)a

  @doc false
  def changeset(user_interest, attrs) do
    user_interest
    |> cast(attrs, @all_fields)
    |> validate_required(@all_fields)
    |> foreign_key_constraint(:interest_id)
    |> foreign_key_constraint(:user_id)
    |> unique_constraint([:user, :project],
      name: :user_id_interest_id_unique_index,
      message: @already_exists
    )
  end

end
