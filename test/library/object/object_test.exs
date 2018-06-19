defmodule Library.ObjectTest do
  use Library.DataCase

  alias Library.Object

  describe "books" do
    alias Library.Object.Book

    @valid_attrs %{author: "some author", description: "some description", isbn: "some isbn", name: "some name"}
    @update_attrs %{author: "some updated author", description: "some updated description", isbn: "some updated isbn", name: "some updated name"}
    @invalid_attrs %{author: nil, description: nil, isbn: nil, name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Object.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Object.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Object.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Object.create_book(@valid_attrs)
      assert book.author == "some author"
      assert book.description == "some description"
      assert book.isbn == "some isbn"
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Object.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Object.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.author == "some updated author"
      assert book.description == "some updated description"
      assert book.isbn == "some updated isbn"
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Object.update_book(book, @invalid_attrs)
      assert book == Object.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Object.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Object.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Object.change_book(book)
    end
  end
end
