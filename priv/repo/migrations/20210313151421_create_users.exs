defmodule KycApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      # add :user_id, :integer, primary_key: true, null: false, foreign_key: :user_parent_id
      add :email, :string
      add :encrypted_password, :string
      add :full_name, :string
      add :age, :integer

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
