defmodule Machixir.User do
  def list_users do
    Repo.all(CustomUser)
  end
end
