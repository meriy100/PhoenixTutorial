defmodule PhoenixTutorial.AccountsTest do
  use PhoenixTutorial.DataCase

  alias PhoenixTutorial.Accounts

  describe "books" do
    alias PhoenixTutorial.Accounts.Book

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Accounts.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Accounts.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Accounts.create_book(@valid_attrs)
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Accounts.update_book(book, @update_attrs)
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_book(book, @invalid_attrs)
      assert book == Accounts.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Accounts.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Accounts.change_book(book)
    end
  end
end
