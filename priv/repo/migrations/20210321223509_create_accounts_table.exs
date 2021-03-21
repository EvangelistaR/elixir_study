defmodule Rocketpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table :accounts do
      add :balance, :decimal
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    #usando constraints para evitar que a conta tenha saldo negativo
    create constraint(:accounts, :balance_must_be_positive_or_zero, checK: "balance >= 0")
  end
end
