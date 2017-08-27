defmodule Gw2timerWeb.WorldBossView do
  use Gw2timerWeb, :view

  def menu?, do: true
  def title, do: "World Bosses!"
  def formatted_event_times(event_times), do: Enum.map(event_times, fn event_time -> format_event_time(event_time.time) end)
  defp format_event_time(%{hour: hour, minute: minute}), do: "#{hour}:#{minute}"
end
