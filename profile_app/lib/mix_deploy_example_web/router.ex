defmodule MixDeployExampleWeb.Router do
  use MixDeployExampleWeb, :router

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

  scope "/", MixDeployExampleWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MixDeployExampleWeb do
  #   pipe_through :api
  # end
  scope "/api", MixDeployExampleWeb do
    pipe_through(:api)
    
    post("/build", ProfileController, :build)
    get("/search/:username", ProfileController, :index)
    get("/profiles/:username", ProfileController, :getprofile)
    get("/setup/:username", ProfileController, :setuptestdata)
  end
end
