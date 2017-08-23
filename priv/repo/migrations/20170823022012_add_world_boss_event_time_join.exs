defmodule Gw2timer.Repo.Migrations.AddWorldBossEventTimeJoin do
  use Ecto.Migration

  def change do
      create table(:world_boss_event_time) do
          add :world_boss_id, references(:worldboss, on_delete: :delete_all)
          add :event_time_id, references(:eventtime, on_delete: :delete_all)
      end
  end
end
