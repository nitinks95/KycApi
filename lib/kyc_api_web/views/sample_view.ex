defmodule KycApiWeb.SampleView do
  use KycApiWeb, :view

  def render("sample.json", %{message: message}) do
    %{ok: message}
  end

end
