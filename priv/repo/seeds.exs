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

boss_time_objects = [
    %{
        boss: %Gw2timer.WorldBoss{name: "Shadow Behemoth"},
        zone: %Gw2timer.Zone{name: "Queensdale"},
        event_times: [
            %Gw2timer.EventTime{time: Ecto.Time.cast! ({1,45,0})},
            %Gw2timer.EventTime{time: Ecto.Time.cast! ({19,45,0})}
        ]
    },
    %{
        boss: %Gw2timer.WorldBoss{name: "Karka Queen"},
        zone: %Gw2timer.Zone{name: "Southsun Cove"},
        event_times: [
            %Gw2timer.EventTime{time: Ecto.Time.cast! ({23,0,0})}
        ]
    }
]

defmodule Gw2timer.DatabaseSeeder do
    alias Gw2timer.Repo
    alias Gw2timer.WorldBoss
    alias Gw2timer.Zone
    alias Gw2timer.EventTime

    def insert_world_boss_full([boss_time_object | tail]) do
        world_boss = Repo.insert! boss_time_object[:boss]
        zone = Repo.insert! boss_time_object[:zone]
        event_times = Enum.map(boss_time_object[:event_times], &(Repo.insert! &1))
        insert_zone_to_world_boss(world_boss, zone)
        insert_world_boss_event_time_join(world_boss, event_times)
        insert_world_boss_full(tail)
    end

    def insert_world_boss_full([]), do: nil

    def insert_world_boss_event_time_join(world_boss, event_times) do
        world_boss
        |> Repo.preload(:event_times)
        |> Ecto.Changeset.change()
        |> Ecto.Changeset.put_assoc(:event_times, event_times)
        |> Repo.update!
    end

    def insert_zone_to_world_boss(world_boss, zone) do
        world_boss
        |> Repo.preload(:zone)
        |> Ecto.Changeset.change()
        |> Ecto.Changeset.put_assoc(:zone, zone)
        |> Repo.update!
    end

    def clear do
        Repo.delete_all WorldBoss
        Repo.delete_all EventTime
        Repo.delete_all Zone
    end
end

Gw2timer.DatabaseSeeder.clear
Gw2timer.DatabaseSeeder.insert_world_boss_full boss_time_objects
