defmodule AgricolWeb.RetinaControllerTest do
  use AgricolWeb.ConnCase

  alias Agricol.Content

  @create_attrs %{content: "some content", is_published: true, title: "some title"}
  @update_attrs %{content: "some updated content", is_published: false, title: "some updated title"}
  @invalid_attrs %{content: nil, is_published: nil, title: nil}

  def fixture(:retina) do
    {:ok, retina} = Content.create_retina(@create_attrs)
    retina
  end

  describe "index" do
    test "lists all post", %{conn: conn} do
      conn = get(conn, Routes.retina_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Post"
    end
  end

  describe "new retina" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.retina_path(conn, :new))
      assert html_response(conn, 200) =~ "New Retina"
    end
  end

  describe "create retina" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.retina_path(conn, :create), retina: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.retina_path(conn, :show, id)

      conn = get(conn, Routes.retina_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Retina"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.retina_path(conn, :create), retina: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Retina"
    end
  end

  describe "edit retina" do
    setup [:create_retina]

    test "renders form for editing chosen retina", %{conn: conn, retina: retina} do
      conn = get(conn, Routes.retina_path(conn, :edit, retina))
      assert html_response(conn, 200) =~ "Edit Retina"
    end
  end

  describe "update retina" do
    setup [:create_retina]

    test "redirects when data is valid", %{conn: conn, retina: retina} do
      conn = put(conn, Routes.retina_path(conn, :update, retina), retina: @update_attrs)
      assert redirected_to(conn) == Routes.retina_path(conn, :show, retina)

      conn = get(conn, Routes.retina_path(conn, :show, retina))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, retina: retina} do
      conn = put(conn, Routes.retina_path(conn, :update, retina), retina: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Retina"
    end
  end

  describe "delete retina" do
    setup [:create_retina]

    test "deletes chosen retina", %{conn: conn, retina: retina} do
      conn = delete(conn, Routes.retina_path(conn, :delete, retina))
      assert redirected_to(conn) == Routes.retina_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.retina_path(conn, :show, retina))
      end
    end
  end

  defp create_retina(_) do
    retina = fixture(:retina)
    %{retina: retina}
  end
end
