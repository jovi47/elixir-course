defmodule ExMonApi.Trainer.Pokemon.Get do
  alias ExMonApi.{Repo, Trainer.Pokemon}
  alias Ecto.{UUID}

  def call(), do: Repo.all(Pokemon)
  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get(uuid)
   end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid)do
    nil -> {:error, "Pokemon not founded"}
    pokemon -> {:ok, pokemon |> Repo.preload(:trainer)}
   end
  end

end
