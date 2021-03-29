defmodule Rocketpay.Account do
  # definir o schema (definir os dados para a tabela)
  use Ecto.Schema
  import Ecto.Changeset

  alias Rocketpay.User

  #variável de módulo usada para definir a chave primária do banco
  @primary_key { :id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{} , params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_be_positive_or_zero) #verificando a constraint antes de inserir os dados no banco
  end
end
