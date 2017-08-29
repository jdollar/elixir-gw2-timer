defmodule Gw2timer.EventTime do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gw2timer.EventTime


  schema "eventtime" do
      many_to_many :world_bosses, Gw2timer.WorldBoss, join_through: "world_boss_event_time"
      field :time, :time

      timestamps()
  end

  @doc false
  def changeset(%EventTime{} = event_time, attrs) do
    event_time
    |> cast(attrs, [:time])
    |> validate_required([:time])
  end
end
