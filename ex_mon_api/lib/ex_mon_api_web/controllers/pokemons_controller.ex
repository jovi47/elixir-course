defmodule ExMonApiWeb.PokemonsController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallBackController

  def show(conn,%{"name" => name}) do
    name
    |> ExMonApi.get_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)
  end
  defp handle_response({:error, _reason} = error, _conn), do: error
end
