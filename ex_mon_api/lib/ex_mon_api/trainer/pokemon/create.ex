defmodule ExMonApi.Trainer.Pokemon.Create do
  alias ExMonApi.{PokeApi.Client, Pokemon, Repo}
  alias ExMonApi.Trainer.Pokemon, as: TrainerPokemon
  alias ExMonApi.Trainer.Get
   def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
   end

   defp handle_response({:ok, body},params) do
     body
     |> Pokemon.build()
     |> create_pokemon(params)
   end
   defp handle_response({:error, _msg} = error, _params), do: error

   defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{"nickname" => nickname, "trainer_id" => trainer_id}) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      trainer_id: trainer_id,
      nickname: nickname
    }

    params
    |> fetch_trainer()
   end

   defp fetch_trainer(%{trainer_id: trainer_id} = params) do
    case Get.call(trainer_id) do
    {:ok, _trainer} ->
      params
    |> TrainerPokemon.build()
    |> handle_build()
    {:error, _reason} = error -> error
    end
   end

   defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
   defp handle_build({:error, _reason}= error), do: error
end
