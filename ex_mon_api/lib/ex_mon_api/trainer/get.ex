defmodule ExMonApi.Trainer.Get do
  alias ExMonApi.{Repo, Trainer}
  alias Ecto.{UUID}

  def call(), do: Repo.all(Trainer)
  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get(uuid)
   end
  end

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
    nil -> {:error, "Trainer not founded"}
    trainer -> {:ok, trainer |> Repo.preload(:pokemon)}
   end
  end

end
