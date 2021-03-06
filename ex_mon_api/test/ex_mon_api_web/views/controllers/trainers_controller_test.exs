defmodule ExMonApiWeb.Controllers.TrainersControllerTest do
  use ExMonApiWeb.ConnCase

  import ExMonApiWeb.Auth.Guardian
  alias ExMonApi.{Trainer}
  describe "show/2" do
    setup %{conn: conn} do
      params = %{name: "Andre Luis", password_hash: "batatinha"}
      {:ok, trainer} = ExMonApi.create_trainer(params)
      {:ok, token, _claims} = encode_and_sign(trainer)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end
    test "when exists a trainer with the given id, returns the trainer", %{conn: conn} do
      params = %{name: "Andre Luis", password_hash: "batatinha"}

      {:ok, %Trainer{id: id}} = ExMonApi.create_trainer(params)

      response =
      conn
      |> get(Routes.trainers_path(conn, :show, id))
      |> json_response(:ok)

      assert %{"name" => "Andre Luis", "inserted_at" => _, "id" => _} = response
    end
    test "when not exists a trainer with the given id, returns an error", %{conn: conn} do
      response =
      conn
      |> get(Routes.trainers_path(conn, :show, "320293"))
      |> json_response(:bad_request)

      assert %{"message" => "Invalid ID format!"} == response
    end
  end
end
