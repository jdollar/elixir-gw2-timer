defmodule Gw2timerWeb.WorldBossController do
  use Gw2timerWeb, :controller
  import Ecto.Query
  alias Gw2timer.WorldBoss

  def index(conn, _params) do
    world_bosses = Gw2timer.Repo.all from world_bosses in WorldBoss,
                                     left_join: zones in assoc(world_bosses, :zone),
                                     left_join: event_times in assoc(world_bosses, :event_times),
                                     group_by: world_bosses.id,
                                     preload: [:zone, :event_times]

    IO.inspect world_bosses

    render conn, "index.html", world_bosses: world_bosses
  end
end
