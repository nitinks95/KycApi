defmodule KycApi.Linker do
  @moduledoc """
  The Linker context.
  """

  import Ecto.Query, warn: false
  alias KycApi.Repo

  alias KycApi.Linker.UserInterest

  @doc """
  Returns the list of user_interest.

  ## Examples

      iex> list_user_interest()
      [%UserInterest{}, ...]

  """
  def list_user_interest do
    Repo.all(UserInterest)
  end

  @doc """
  Gets a single user_interest.

  Raises `Ecto.NoResultsError` if the User interest does not exist.

  ## Examples

      iex> get_user_interest!(123)
      %UserInterest{}

      iex> get_user_interest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_interest!(id), do: Repo.get!(UserInterest, id)

  @doc """
  Creates a user_interest.

  ## Examples

      iex> create_user_interest(%{field: value})
      {:ok, %UserInterest{}}

      iex> create_user_interest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_interest(attrs \\ %{}) do
    %UserInterest{}
    |> UserInterest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_interest.

  ## Examples

      iex> update_user_interest(user_interest, %{field: new_value})
      {:ok, %UserInterest{}}

      iex> update_user_interest(user_interest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_interest(%UserInterest{} = user_interest, attrs) do
    user_interest
    |> UserInterest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_interest.

  ## Examples

      iex> delete_user_interest(user_interest)
      {:ok, %UserInterest{}}

      iex> delete_user_interest(user_interest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_interest(%UserInterest{} = user_interest) do
    Repo.delete(user_interest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_interest changes.

  ## Examples

      iex> change_user_interest(user_interest)
      %Ecto.Changeset{source: %UserInterest{}}

  """
  def change_user_interest(%UserInterest{} = user_interest) do
    UserInterest.changeset(user_interest, %{})
  end
end
