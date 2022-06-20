defmodule ExMonApi.Trainer do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExMonApi.Trainer.{Pokemon}
  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    timestamps()
    has_many(:pokemon, Pokemon)
  end

  @required_params [:name, :password_hash]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{},params)
  def changeset(trainer,params), do: create_changeset(trainer, params)

  defp create_changeset(module_or_trainer, params) do
    module_or_trainer
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password_hash, min: 6)
  end

  #defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
  #  change(changeset, Base.encrypt(changeset.password))
  #end
  #defp put_pass_hash(changeset), do: changeset
end
