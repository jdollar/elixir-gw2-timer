defmodule Gw2timerWeb.PageControllerTest do
  use Gw2timerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Gw2Timer!"
  end
end
