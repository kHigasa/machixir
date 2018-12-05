defmodule Machixir.AccountsTest do
  use Machixir.DataCase

  alias Machixir.Accounts

  describe "users" do
    alias Machixir.Accounts.User

    @valid_attrs %{avatar: "some avatar", date_joined: ~N[2010-04-17 14:00:00], email: "some email", first_name: "some first_name", hourly_wage: 42, is_active: true, is_staff: true, is_superuser: true, last_login: ~N[2010-04-17 14:00:00], last_name: "some last_name", password: "some password", travel_expense: 42, username: "some username"}
    @update_attrs %{avatar: "some updated avatar", date_joined: ~N[2011-05-18 15:01:01], email: "some updated email", first_name: "some updated first_name", hourly_wage: 43, is_active: false, is_staff: false, is_superuser: false, last_login: ~N[2011-05-18 15:01:01], last_name: "some updated last_name", password: "some updated password", travel_expense: 43, username: "some updated username"}
    @invalid_attrs %{avatar: nil, date_joined: nil, email: nil, first_name: nil, hourly_wage: nil, is_active: nil, is_staff: nil, is_superuser: nil, last_login: nil, last_name: nil, password: nil, travel_expense: nil, username: nil}

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
      assert user.avatar == "some avatar"
      assert user.date_joined == ~N[2010-04-17 14:00:00]
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.hourly_wage == 42
      assert user.is_active == true
      assert user.is_staff == true
      assert user.is_superuser == true
      assert user.last_login == ~N[2010-04-17 14:00:00]
      assert user.last_name == "some last_name"
      assert user.password == "some password"
      assert user.travel_expense == 42
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.avatar == "some updated avatar"
      assert user.date_joined == ~N[2011-05-18 15:01:01]
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.hourly_wage == 43
      assert user.is_active == false
      assert user.is_staff == false
      assert user.is_superuser == false
      assert user.last_login == ~N[2011-05-18 15:01:01]
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
      assert user.travel_expense == 43
      assert user.username == "some updated username"
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
end
