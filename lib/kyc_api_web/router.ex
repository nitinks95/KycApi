defmodule KycApiWeb.Router do
  use KycApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug KycApiWeb.Auth.Pipeline
  end

  scope "/api", KycApiWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", KycApiWeb do
    pipe_through [:api, :auth]
    resources "/users", UserController, except: [:new, :edit, :create]
    post "/interest/create", InterestController, :create
    resources "/interest", InterestController
  end
end
