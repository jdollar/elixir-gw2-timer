defmodule Gw2timer.WorldBoss do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gw2timer.WorldBoss


  schema "worldboss" do
    belongs_to :zone, Gw2timer.Zone
    many_to_many :event_times, Gw2timer.EventTime, join_through: "world_boss_event_time"

    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%WorldBoss{} = world_boss, attrs) do
    world_boss
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
