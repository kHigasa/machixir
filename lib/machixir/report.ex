defmodule Machixir.Report do
  use Ecto.Schema
  import Ecto.Changeset


  schema "report" do
    field :is_draft, :boolean, default: true
    field :date, :date
    field :opening_time, :time
    field :closing_time, :time
    field :recess, :time
    field :feeling, :string
    field :core_value, :string
    field :done, :string
    field :todo, :string
    field :review, :string
    belongs_to :user, Machixir.User
  end

  @doc false
  def changeset(report, attrs) do
    report
    |> cast(attrs, [:is_draft, :date, :opening_time, :closing_time, :recess, :feeling, :core_value, :done, :todo, :review])
    |> validate_required([:is_draft, :date, :opening_time, :closing_time, :recess, :feeling, :core_value, :done, :todo, :review])
  end
end
