defmodule MachixirWeb.Resolvers.Users do
  def list_users(_parent, _args, _resolution) do
    case Machixir.User.list_users() do
      nil ->
        {:error, "not found"}
      user ->
        {:ok, user}
    end
  end
end
