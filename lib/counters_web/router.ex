defmodule CountersWeb.Router do
  use CountersWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CountersWeb do
    pipe_through :api
  end
end
