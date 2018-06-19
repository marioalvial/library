defmodule LibraryWeb.BookController do
  use LibraryWeb, :controller

  alias Library.Object
  alias Library.Object.Book

  action_fallback LibraryWeb.FallbackController

  def index(conn, _params) do
    books = Object.list_books()
    render(conn, "index.json", books: books)
  end

  def create(conn, book_params) do
    with {:ok, %Book{} = book} <- Object.create_book(book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", book_path(conn, :show, book))
      |> render("show.json", book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Object.get_book!(id)
    render(conn, "show.json", book: book)
  end

  def update(conn, params) do
    {id, book_params} = Map.pop(params, "id")
    book = Object.get_book!(id)
    with {:ok, %Book{} = book} <- Object.update_book(book, book_params) do
      render(conn, "show.json", book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Object.get_book!(id)
    with {:ok, %Book{}} <- Object.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end
end
