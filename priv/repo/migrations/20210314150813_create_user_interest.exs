defmodule KycApi.Repo.Migrations.CreateUserInterest do
  use Ecto.Migration

  def change do
    create table(:user_interest, primary_key: false) do
      add :user_id, references(:users, on_delete: :nothing), primary_key: true
      add :interest_id, references(:interest, on_delete: :nothing), primary_key: true
    end

    create index(:user_interest, [:user_id])
    create index(:user_interest, [:interest_id])
  end
end
