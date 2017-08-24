defmodule Gw2timerWeb.WorldBossController do
  use Gw2timerWeb, :controller
  alias Gw2timer.WorldBoss

  def index(conn, _params) do
    world_bosses = Gw2timer.Repo.all(WorldBoss)
                    |> Gw2timer.Repo.preload(:zone)
                    |> Gw2timer.Repo.preload(:event_times)
    render conn, "index.html", world_bosses: world_bosses
  end
end
