defmodule CountersWeb.Router do
  use CountersWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CountersWeb do
    pipe_through :api
  end

  scope "/v1", CountersWeb do
    pipe_through :api

    get "/current_value/:counter_name", CountersController, :show
    post "/increment/:counter_name", CountersController, :post
  end
end
