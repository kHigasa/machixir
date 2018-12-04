defmodule MachixirWeb.Resolvers.Users do
  def find(_parent, %{id: id}, _resolution) do
    case Machixir.Users.find(id) do
       nil ->
         {:error, "User ID #{id} not found"}
       user ->
         {:ok, user}
    end
  end
end
