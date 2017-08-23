defmodule Gw2timer.Repo.Migrations.AddWorldBossEventTimeJoin do
  use Ecto.Migration

  def change do
      create table(:world_boss_event_time) do
          add :world_boss_id, references(:worldboss)
          add :event_time_id, references(:eventtime)
      end
  end
end
