defmodule KycApiWeb.InterestView do
  use KycApiWeb, :view
  alias KycApiWeb.InterestView

  def render("index.json", %{interest: interest}) do
    %{data: render_many(interest, InterestView, "interest.json")}
  end

  def render("show.json", %{interest: interest}) do
    %{data: render_one(interest, InterestView, "interest.json")}
  end

  def render("interest.json", %{interest: interest}) do
    %{id: interest.id,
      topic: interest.topic,
      description: interest.description}
  end
end
