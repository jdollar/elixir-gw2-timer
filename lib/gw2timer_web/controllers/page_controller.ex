defmodule Gw2timerWeb.PageController do
  use Gw2timerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
