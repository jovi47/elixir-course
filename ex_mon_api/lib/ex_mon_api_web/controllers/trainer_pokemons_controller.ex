defmodule ExMonApiWeb.TrainerPokemonsController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallBackController

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer_pokemons()
    |> handle_response(conn, :created, "create.json")
  end

  def delete(conn, %{"id" => uuid}) do
    uuid
    |> ExMonApi.delete_trainer_pokemons()
    |> handle_delete(conn)
  end

  def show(conn,%{"id" => uuid}) do
    uuid
    |> ExMonApi.get_trainer_pokemon()
    |> handle_response(conn, :ok, "show.json")
  end

  def update(conn, params) do
    params
    |> ExMonApi.update_trainer_pokemon()
    |> handle_response(conn, :ok, "update.json")
  end
  defp handle_response({:ok, pokemon}, conn, status, view) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
  end
  defp handle_response({:error, _changset} = error, _conn, _status, _view), do: error

  defp handle_delete({:ok, _pokemon}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end
  defp handle_delete({:error, _reason} = error, _conn), do: error
end
