defmodule Gw2timer.Zone do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gw2timer.Zone


  schema "zone" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Zone{} = zone, attrs) do
    zone
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
