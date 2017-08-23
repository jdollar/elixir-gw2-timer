defmodule Gw2timer.WorldBoss do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gw2timer.WorldBoss


  schema "worldboss" do
    many_to_many :event_times, Gw2timer.EventTime, join_through: "world_boss_event_time"

    field :name, :string
    field :zone, :string

    timestamps()
  end

  @doc false
  def changeset(%WorldBoss{} = world_boss, attrs) do
    world_boss
    |> cast(attrs, [:name, :zone])
    |> validate_required([:name, :zone])
  end
end
