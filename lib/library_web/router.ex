defmodule LibraryWeb.Router do
  use LibraryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/library", LibraryWeb do
    pipe_through :api

    resources "/books", BookController, except: [:new, :edit]

  end
end
