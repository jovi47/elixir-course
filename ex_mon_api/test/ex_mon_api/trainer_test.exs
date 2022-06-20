defmodule ExMonApi.TrainerTest do
  use ExMonApi.DataCase

  alias ExMonApi.{Trainer}

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Rafael", password_hash: "123456"}
      response = Trainer.changeset(params)

      assert %Ecto.Changeset{changes: %{name: "Rafael", password_hash: "123456"}, errors: [], data: %ExMonApi.Trainer{}, valid?: true}
      = response
    end
    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "Rafael"}
      response = Trainer.changeset(params)

      assert %Ecto.Changeset{changes: %{name: "Rafael"}, data: %ExMonApi.Trainer{}, valid?: false}
      = response

      assert errors_on(response) == %{password_hash: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when all params are valid, returns a Trainer struct" do
      params = %{name: "Rafael", password_hash: "123456"}
      response = Trainer.build(params)

      assert {:ok, %Trainer{name: "Rafael", password_hash: "123456"}}
      = response
    end
    test "when all invalid params, returns an error" do
      params = %{password_hash: "123456"}
      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{}
      = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
