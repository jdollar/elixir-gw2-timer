defmodule Gw2timer.Repo.Migrations.CreateEventtime do
  use Ecto.Migration

  def change do
    create table(:eventtime) do
      add :time, :time

      timestamps()
    end

  end
end
