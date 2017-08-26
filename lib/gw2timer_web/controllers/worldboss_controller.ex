defmodule Gw2timerWeb.WorldBossController do
  use Gw2timerWeb, :controller
  import Ecto.Query
  alias Gw2timer.WorldBoss
  alias Gw2timer.Repo

  def index(conn, _params) do
    world_bosses = Repo.all from world_bosses in WorldBoss,
                                     left_join: zones in assoc(world_bosses, :zone),
                                     left_join: event_times in assoc(world_bosses, :event_times),
                                     group_by: world_bosses.id,
                                     order_by: [asc: world_bosses.name],
                                     preload: [:zone, :event_times]

    IO.inspect world_bosses

    render conn, "index.html", world_bosses: world_bosses
  end

  def show(conn, %{"id" => world_boss_id}) do
     world_boss = Repo.one from world_boss in WorldBoss,
                           left_join: zones in assoc(world_boss, :zone),
                           left_join: event_times in assoc(world_boss, :event_times),
                           where: world_boss.id == ^world_boss_id,
                           group_by: world_boss.id,
                           preload: [:zone, :event_times]
     render conn, "show.html", world_boss: world_boss
  end
end
