defmodule Gw2timerWeb.WorldBossController do
  use Gw2timerWeb, :controller
  import Ecto.Query
  alias Gw2timer.WorldBoss
  alias Gw2timer.EventTime
  alias Gw2timer.Repo

  def index(conn, _params) do
      world_boss_events = Repo.all from event_time in EventTime,
                                    inner_join: world_bosses in assoc(event_time, :world_bosses),
                                    inner_join: zones in assoc(world_bosses, :zone),
                                    order_by: [asc: event_time.time],
                                    preload: [world_bosses: {world_bosses, :zone}]

      render conn, "index.html", world_boss_events: world_boss_events, menuTabValue: "table"
  end

  def timer(conn, _params) do
      world_boss_event = Repo.one from event_time in EventTime,
                            inner_join: world_bosses in assoc(event_time, :world_bosses),
                            inner_join: zones in assoc(world_bosses, :zone),
                            where: event_time.time >= ^Time.utc_now,
                            order_by: [asc: event_time.time],
                            limit: 1,
                            preload: [world_bosses: {world_bosses, :zone}]
      render conn, "timer.html", menuTabValue: "timer", world_boss_event: world_boss_event
  end

  def show(conn, %{"id" => world_boss_id}) do
     world_boss = Repo.one from world_boss in WorldBoss,
                           where: world_boss.id == ^world_boss_id,
                           preload: [:zone, :event_times]

     render conn, "show.html", world_boss: world_boss, menuTabValue: "table"
  end
end
