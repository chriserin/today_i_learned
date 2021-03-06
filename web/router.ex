defmodule TodayILearned.Router do
  use TodayILearned.Web, :router

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

  scope "/", TodayILearned do
    pipe_through :browser # Use the default browser stack

    get "/", PostController, :index
    resources "/posts", PostController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodayILearned do
  #   pipe_through :api
  # end
end
