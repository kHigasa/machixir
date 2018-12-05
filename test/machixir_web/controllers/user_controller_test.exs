defmodule MachixirWeb.UserControllerTest do
  use MachixirWeb.ConnCase

  alias Machixir.Accounts

  @create_attrs %{avatar: "some avatar", date_joined: ~N[2010-04-17 14:00:00], email: "some email", first_name: "some first_name", hourly_wage: 42, is_active: true, is_staff: true, is_superuser: true, last_login: ~N[2010-04-17 14:00:00], last_name: "some last_name", password: "some password", travel_expense: 42, username: "some username"}
  @update_attrs %{avatar: "some updated avatar", date_joined: ~N[2011-05-18 15:01:01], email: "some updated email", first_name: "some updated first_name", hourly_wage: 43, is_active: false, is_staff: false, is_superuser: false, last_login: ~N[2011-05-18 15:01:01], last_name: "some updated last_name", password: "some updated password", travel_expense: 43, username: "some updated username"}
  @invalid_attrs %{avatar: nil, date_joined: nil, email: nil, first_name: nil, hourly_wage: nil, is_active: nil, is_staff: nil, is_superuser: nil, last_login: nil, last_name: nil, password: nil, travel_expense: nil, username: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_path(conn, :show, id)

      conn = get(conn, Routes.user_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == Routes.user_path(conn, :show, user)

      conn = get(conn, Routes.user_path(conn, :show, user))
      assert html_response(conn, 200) =~ "some updated avatar"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.user_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
