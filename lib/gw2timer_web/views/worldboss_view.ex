defmodule Gw2timerWeb.WorldBossView do
  use Gw2timerWeb, :view

  def menu?, do: true
  def title, do: "World Bosses!"
  def format_event_time(%{hour: hour, minute: minute}), do: "#{hour}:#{minute}"
end
