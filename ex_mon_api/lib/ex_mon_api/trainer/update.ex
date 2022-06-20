defmodule ExMonApi.Trainer.Update do
  alias ExMonApi.{Repo, Trainer}
  alias Ecto.{UUID}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
       :error -> {:error, "Invalid ID format!"}
       {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not founded"}
      trainer -> update_trainer(trainer, params)
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)

  defp update_trainer(trainer, params) do
    IO.inspect(trainer)
    IO.inspect(params)

    trainer
    |> Trainer.changeset(params)
    |> Repo.update()
  end
end