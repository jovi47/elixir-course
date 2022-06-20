defmodule ExMonApi.Trainer.CreateTest do
  use ExMonApi.{DataCase}
 alias ExMonApi.{Trainer, Trainer.Create, Repo}

 describe "call/1" do
   test "when all params are valid, creates a trainer" do
    params = %{name: "Joao Victor Sousa", password_hash: "83023s"}

    count_before = Repo.aggregate(Trainer, :count)

    response = Create.call(params)

    count_after = Repo.aggregate(Trainer, :count)

    assert {:ok, %Trainer{name: "Joao Victor Sousa", password_hash: "83023s"}} = response
    assert count_after > count_before
   end
   test "when there are invalid params, returns the error" do
    params = %{name: "Joao Victor Sousa"}

    count_before = Repo.aggregate(Trainer, :count)

    {:error, response} = Create.call(params)

    count_after = Repo.aggregate(Trainer, :count)

    assert %Ecto.Changeset{valid?: false} = response
    assert count_after <= count_before
    assert errors_on(response) == %{password_hash: ["can't be blank"]}
   end
 end
end
