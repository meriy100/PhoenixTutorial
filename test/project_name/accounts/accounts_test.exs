defmodule ProjectName.AccountsTest do
  use ProjectName.DataCase

  alias ProjectName.Accounts

  describe "users" do
    alias ProjectName.Accounts.User

    @valid_attrs %{age: 42, name: "some name"}
    @update_attrs %{age: 43, name: "some updated name"}
    @invalid_attrs %{age: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.age == 42
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.age == 43
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "books" do
    alias ProjectName.Accounts.Book

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
      assert {:ok, book} = Accounts.update_book(book, @update_attrs)
      assert %Book{} = book
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
