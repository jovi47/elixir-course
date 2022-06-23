defmodule ExMonApiWeb.Auth.Guardian do
  use Guardian, otp_app: :ex_mon_api
  alias ExMonApi.{Repo,Trainer}
  def subject_for_token(trainer, _claims) do
    sub = to_string(trainer.id)
    {:ok, sub}
  end
  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> ExMonApi.get_trainer()
  end

  def authenticate(%{"id" => trainer_id, "password_hash" => password_hash}) do
    case Repo.get(Trainer, trainer_id) do
      nil -> {:error, "Trainer not found"}
      trainer -> validate_password(trainer, password_hash)
    end
  end

  defp validate_password(trainer, password) do
    case String.equivalent?(trainer.password_hash,password) do
       true -> create_token(trainer)
       false -> {:error, :unauthorized}
    end
  end

  defp create_token(trainer) do
   {:ok, token, _claims} = encode_and_sign(trainer)
   {:ok, token}
  end
end
