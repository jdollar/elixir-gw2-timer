# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Gw2timer.Repo.insert!(%Gw2timer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Gw2timer.DatabaseSeeder do
    alias Gw2timer.Repo
    alias Gw2timer.WorldBoss
    alias Gw2timer.EventTime

    def insert_world_boss do
        Repo.insert! %WorldBoss{
            name: "test",
            zone: "test3"
        }
    end

    def insert_event_times do
        Repo.insert! %EventTime{
            time: Ecto.Time.cast!({1,45,0})
        }
    end

    def insert_world_boss_event_time_join(world_boss, event_time) do
        world_boss
        |> Repo.preload(:event_times)
        |> Ecto.Changeset.change()
        |> Ecto.Changeset.put_assoc(:event_times, [event_time])
        |> Repo.update!
    end

    def clear do
        Repo.delete_all WorldBoss
        Repo.delete_all EventTime
    end
end

Gw2timer.DatabaseSeeder.clear
world_boss = Gw2timer.DatabaseSeeder.insert_world_boss
event_time = Gw2timer.DatabaseSeeder.insert_event_times
Gw2timer.DatabaseSeeder.insert_world_boss_event_time_join(world_boss, event_time)
