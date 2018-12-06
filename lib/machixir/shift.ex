defmodule Machixir.Shift do
  use Ecto.Schema
  import Ecto.Changeset


  schema "shift" do
    field :date, :date
    field :opening_time, :time
    field :closing_time, :time
    belongs_to :user, Machixir.User
  end

  @doc false
  def changeset(shift, attrs) do
    shift
    |> cast(attrs, [:date, :opening_time, :closing_time])
    |> validate_required([:date, :opening_time, :closing_time])
  end
end
