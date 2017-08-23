defmodule Gw2timer.EventTime do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gw2timer.EventTime


  schema "eventtime" do
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
