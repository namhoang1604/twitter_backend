defmodule TwitterServerWeb.Router do
  use TwitterServerWeb, :router

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

  scope "/", TwitterServerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TwitterServerWeb do
    pipe_through :api

    resources "/tweets", TweetController, except: [:new, :edit, :update, :delete]
    post "/tweets/:id/retweet", TweetController, :retweet
  end
end
