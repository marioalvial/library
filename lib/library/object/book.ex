defmodule Library.Object.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "books" do
    field :author, :string
    field :description, :string
    field :isbn, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :description, :author, :isbn])
    |> validate_required([:name, :description, :author, :isbn])
  end
end
