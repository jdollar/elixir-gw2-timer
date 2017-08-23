defmodule Gw2timer.Repo.Migrations.CreateWorldboss do
  use Ecto.Migration

  def change do
    create table(:worldboss) do
      add :name, :string
      add :zone, :string

      timestamps()
    end

  end
end
