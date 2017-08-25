defmodule Gw2timerWeb.WorldBossView do
  use Gw2timerWeb, :view
  use Timex
  import Ecto.Time

  def format_event_time(event_time) do
      "#{event_time.hour}:#{event_time.minute}"
  end
end
