defmodule Machixir.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "custom_user" do
    field :avatar, :string
    field :date_joined, :naive_datetime
    field :email, :string
    field :first_name, :string
    field :hourly_wage, :integer
    field :is_active, :boolean, default: false
    field :is_staff, :boolean, default: false
    field :is_superuser, :boolean, default: false
    field :last_login, :naive_datetime
    field :last_name, :string
    field :password, :string
    field :travel_expense, :integer
    field :username, :string

    has_many :reports, Machixir.Report
    has_many :shifts, Machixir.Shift
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:password, :last_login, :is_superuser, :username, :first_name, :last_name, :email, :is_staff, :is_active, :date_joined, :avatar, :hourly_wage, :travel_expense])
    |> validate_required([:password, :last_login, :is_superuser, :username, :first_name, :last_name, :email, :is_staff, :is_active, :date_joined, :avatar, :hourly_wage, :travel_expense])
  end
end
