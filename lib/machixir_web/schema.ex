defmodule MachixirWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  import_types MachixirWeb.Schema.UserTypes
  alias MachixirWeb.Resolvers

  query do
    @desc "Get a user"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Resolvers.Users.find/3
    end
  end
end
