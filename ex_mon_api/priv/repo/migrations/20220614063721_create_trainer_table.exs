defmodule ExMonApi.Repo.Migrations.CreateTrainerTable do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :password_hash, :string
      timestamps()
    end
  end
end
