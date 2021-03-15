defmodule KycApiWeb.UserView do
  use KycApiWeb, :view
  alias KycApiWeb.UserView
  alias KycApiWeb.InterestView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      full_name: user.full_name,
      age: user.age,
      #interest: render_many(user.interests, InterestView, "interest.json")
    }
  end

  def render("userToken.json", %{user: user, token: token}) do
    %{
      id: user.id,
      email: user.email,
      full_name: user.full_name,
      age: user.age,
      token: token,
      #interest: render_many(user.interests, InterestView, "interest.json")
    }
  end

end
