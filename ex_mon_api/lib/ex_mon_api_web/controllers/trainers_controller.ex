defmodule ExMonApiWeb.TrainersController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallBackController
  def create(conn, params) do
    params
    |> ExMonApi.create_trainer()
    |> handle_response(conn, :created, "create.json")
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExMonApi.delete_trainer()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExMonApi.get_trainer()
    |> handle_response(conn, :ok, "show.json")
  end

  def update(conn, params) do
    params
    |> ExMonApi.update_trainer()
    |> handle_response(conn, :ok, "update.json")
  end

  defp handle_response({:ok, trainer}, conn, status, view) do
    conn
    |> put_status(status)
    |> render(view, trainer: trainer)
  end
  defp handle_response({:error, _changset} = error, _conn, _status, _view), do: error

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end
  defp handle_delete({:error, _reason} = error, _conn), do: error
end
