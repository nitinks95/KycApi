defmodule KycApi.Repo.Migrations.CreateInterest do
  use Ecto.Migration

  def change do

    execute "CREATE EXTENSION citext"

    create table(:interest) do
      add :topic, :citext
      add :description, :string

      timestamps()
    end

    create unique_index(:interest, [:topic])
  end
end
