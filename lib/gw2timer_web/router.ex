defmodule Gw2timerWeb.Router do
  use Gw2timerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Gw2timerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/worldbosses", Gw2timerWeb do
      pipe_through :browser

      get "/", WorldBossController, :index
      get "/timer", WorldBossController, :timer
      get "/:id", WorldBossController, :show
  end
end
