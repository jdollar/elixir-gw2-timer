defmodule Gw2timer.Repo.Migrations.CreateZone do
  use Ecto.Migration

  def change do
    create table(:zone) do
      add :name, :string

      timestamps()
    end

  end
end
