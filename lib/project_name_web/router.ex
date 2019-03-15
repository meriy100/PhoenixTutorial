defmodule ProjectNameWeb.Router do
  use ProjectNameWeb, :router

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

  scope "/", ProjectNameWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/foo", FooController, :index
  end


  # Other scopes may use custom stacks.
  # scope "/api", ProjectNameWeb do
  #   pipe_through :api
  # end
end
