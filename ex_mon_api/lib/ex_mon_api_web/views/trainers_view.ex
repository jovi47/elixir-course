defmodule ExMonApiWeb.TrainersView do
  alias ExMonApi.{Trainer}
  use ExMonApiWeb, :view

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Trainer created",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end
end
