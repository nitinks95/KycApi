defmodule KycApi.Interestctx.Interest do
  use Ecto.Schema
  import Ecto.Changeset

  alias KycApi.Accounts.User

  schema "interest" do
    field :description, :string
    field :topic, :string

    many_to_many :user, User, join_through: "user_interest"

    timestamps()
  end

  @all_fields ~w(topic description)a

  @doc false
  def changeset(interest, attrs) do
    interest
    |> cast(attrs, @all_fields)
    |> validate_required(@all_fields)
    |> unique_constraint(:topic)
  end
end
