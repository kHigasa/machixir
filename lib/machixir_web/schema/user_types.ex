defmodule MachixirWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  @desc "A user"
  object :user do
    field :id, :id
    field :username, :string
  end
end
