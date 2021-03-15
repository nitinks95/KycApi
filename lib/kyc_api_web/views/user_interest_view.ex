defmodule KycApiWeb.UserInterestView do
  use KycApiWeb, :view
  alias KycApiWeb.UserInterestView

  def render("index.json", %{user_interest: user_interest}) do
    %{data: render_many(user_interest, UserInterestView, "user_interest.json")}
  end

  def render("show.json", %{user_interest: user_interest}) do
    %{data: render_one(user_interest, UserInterestView, "user_interest.json")}
  end

  def render("user_interest.json", %{user_interest: user_interest}) do
    %{id: user_interest.id}
  end
end
