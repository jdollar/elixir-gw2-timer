defmodule Gw2timerWeb.WorldBossControllerTest do
  use Gw2timerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/worldbosses"
    assert html_response(conn, 200) =~ "World Bosses!"
  end
end
