defmodule ExMonApi do
  alias ExMonApi.{Trainer, Pokemon}

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
  defdelegate get_trainer(params), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call
  defdelegate get_pokemon(params), to: Pokemon.Get, as: :call
  defdelegate create_trainer_pokemons(params), to: Trainer.Pokemon.Create, as: :call
  defdelegate delete_trainer_pokemons(params), to: Trainer.Pokemon.Delete, as: :call
  defdelegate get_trainer_pokemon(params), to: Trainer.Pokemon.Get, as: :call
  defdelegate update_trainer_pokemon(params), to: Trainer.Pokemon.Update, as: :call
end
