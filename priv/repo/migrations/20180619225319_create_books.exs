defmodule Library.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :description, :string
      add :author, :string
      add :isbn, :string

      timestamps()
    end

  end
end
