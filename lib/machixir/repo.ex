defmodule Machixir.Repo do
  use Ecto.Repo,
    otp_app: :machixir,
    adapter: Ecto.Adapters.Postgres
end
