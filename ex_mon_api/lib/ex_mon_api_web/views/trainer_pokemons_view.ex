defmodule ExMonApiWeb.TrainerPokemonsView do
  alias ExMonApi.{Trainer.Pokemon}
  use ExMonApiWeb, :view

  def render("create.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at, nickname: nickname, types: types, trainer_id: trainer_id, weight: weight}}) do
    %{
      message: "Pokemon created",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        types: types,
        nickname: nickname,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("update.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at, nickname: nickname, types: types, trainer_id: trainer_id, weight: weight}}) do
    %{
      message: "Pokemon updated",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        types: types,
        nickname: nickname,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("show.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at, nickname: nickname, types: types, trainer: %{id: trainer_id, name: trainer_name}, weight: weight}}) do
    %{
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        types: types,
        nickname: nickname,
        trainer: %{trainer_id: trainer_id, trainer_name: trainer_name},
        weight: weight
      }
    }
  end
end
