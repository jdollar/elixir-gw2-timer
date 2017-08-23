# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gw2timer,
  ecto_repos: [Gw2timer.Repo]

# Configures the endpoint
config :gw2timer, Gw2timerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lMjEjU4JpugA23merWcovE9oFNptUq6IUFZXE8y1wGj/euABoy1TZamACH7IPlzV",
  render_errors: [view: Gw2timerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gw2timer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
