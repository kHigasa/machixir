defmodule MachixirWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  import_types MachixirWeb.Schema.UserTypes
  alias MachixirWeb.Resolvers

  query do
    @desc "Get all user"
    field :user, list_of(:user) do
      resolve &Resolvers.Users.list_users/3
    end
  end
end
