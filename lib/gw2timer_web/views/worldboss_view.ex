defmodule Gw2timerWeb.WorldBossView do
  use Gw2timerWeb, :view

  def menu?, do: true
  def title, do: "World Bosses!"
  def format_event_time(event_time), do: "#{event_time.hour}:#{event_time.minute}"
end
