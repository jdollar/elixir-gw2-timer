defmodule Gw2timer.Repo.Migrations.AddZoneReferenceToWorldBoss do
  use Ecto.Migration

  def change do
      alter table(:worldboss) do
          add :zone_id, references(:zone)
          remove :zone
      end
  end
end
