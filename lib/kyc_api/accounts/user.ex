defmodule KycApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias KycApi.Interestctx.Interest
  alias KycApi.Repo

  schema "users" do
    # field :user_id, :id, primary_key: true
    field :age, :integer
    field :email, :string
    field :full_name, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    many_to_many :interest, Interest, join_through: "user_interest"

    timestamps()
  end

  @required_fields ~w(email password age full_name)a

  @all_fields ~w(email password age full_name)a

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @all_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> put_hashed_password
  end

  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}}
        ->
          put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
          changeset
    end
  end

  def upsert_user_projects({_, user}, %{interest: interests} = _params) when interests != [] do
    user_interests =
      interests
      |> add_new_inserts
      |> get_interest_repo
    #with {:ok, _struct} <-
    #    user
    #    |> changeset_update_interest(user_interests)
    #    |> Repo.update() do
    #  {:ok, KycApi.Accounts.get_user!(user.id)}
    #else
    #  error ->
    #    error
    #end
    user
      |> changeset_update_interest(user_interests)
      |> Repo.update()
    KycApi.Accounts.get_user!(user.id)
  end

  def changeset_update_interest(user, interests) do
    KycApi.Accounts.get_user!(user.id)
    |> cast(%{}, @all_fields)
    |> put_assoc(:interest, interests)
  end

  def add_new_inserts(interests) do
    Enum.map(interests, fn interest ->
      case Repo.get_by(Interest, interest) do
        nil -> KycApi.Interestctx.create_interest(interest)
        res -> res
      end
    end)
    interests
  end

  def get_interest_repo(interests) do
    Enum.map(interests, fn interest ->
      Repo.get_by(Interest, interest)
    end)
  end

end
