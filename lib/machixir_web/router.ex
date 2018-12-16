defmodule MachixirWeb.Router do
  use MachixirWeb, :router
  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", MachixirWeb do
    pipe_through [:browser]

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  scope "/", MachixirWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/graphql",
  Absinthe.Plug,
  schema: MachixirWeb.Schema

  forward "/graphiql",
  Absinthe.Plug.GraphiQL,
  schema: MachixirWeb.Schema,
  interface: :simple

  # Other scopes may use custom stacks.
  #  scope "/api", MachixirWeb do
  #    pipe_through :api
  #  end
end
