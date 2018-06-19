defmodule LibraryWeb.BookView do
  use LibraryWeb, :view
  alias LibraryWeb.BookView

  def render("index.json", %{books: books}) do
    render_many(books, BookView, "book.json")
  end

  def render("show.json", %{book: book}) do
    render_one(book, BookView, "book.json")
  end

  def render("book.json", %{book: book}) do
    %{id: book.id,
      name: book.name,
      description: book.description,
      author: book.author,
      isbn: book.isbn}
  end
end
