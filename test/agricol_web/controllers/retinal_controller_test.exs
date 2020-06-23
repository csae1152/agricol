defmodule AgricolWeb.RetinalControllerTest do
  use AgricolWeb.ConnCase

  alias Agricol.Diagnostics

  @create_attrs %{description: "some description", retinaimage: "some retinaimage", timestamps: "some timestamps"}
  @update_attrs %{description: "some updated description", retinaimage: "some updated retinaimage", timestamps: "some updated timestamps"}
  @invalid_attrs %{description: nil, retinaimage: nil, timestamps: nil}

  def fixture(:retinal) do
    {:ok, retinal} = Diagnostics.create_retinal(@create_attrs)
    retinal
  end

  describe "index" do
    test "lists all retinals", %{conn: conn} do
      conn = get(conn, Routes.retinal_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Retinals"
    end
  end

  describe "new retinal" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.retinal_path(conn, :new))
      assert html_response(conn, 200) =~ "New Retinal"
    end
  end

  describe "create retinal" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.retinal_path(conn, :create), retinal: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.retinal_path(conn, :show, id)

      conn = get(conn, Routes.retinal_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Retinal"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.retinal_path(conn, :create), retinal: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Retinal"
    end
  end

  describe "edit retinal" do
    setup [:create_retinal]

    test "renders form for editing chosen retinal", %{conn: conn, retinal: retinal} do
      conn = get(conn, Routes.retinal_path(conn, :edit, retinal))
      assert html_response(conn, 200) =~ "Edit Retinal"
    end
  end

  describe "update retinal" do
    setup [:create_retinal]

    test "redirects when data is valid", %{conn: conn, retinal: retinal} do
      conn = put(conn, Routes.retinal_path(conn, :update, retinal), retinal: @update_attrs)
      assert redirected_to(conn) == Routes.retinal_path(conn, :show, retinal)

      conn = get(conn, Routes.retinal_path(conn, :show, retinal))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, retinal: retinal} do
      conn = put(conn, Routes.retinal_path(conn, :update, retinal), retinal: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Retinal"
    end
  end

  describe "delete retinal" do
    setup [:create_retinal]

    test "deletes chosen retinal", %{conn: conn, retinal: retinal} do
      conn = delete(conn, Routes.retinal_path(conn, :delete, retinal))
      assert redirected_to(conn) == Routes.retinal_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.retinal_path(conn, :show, retinal))
      end
    end
  end

  defp create_retinal(_) do
    retinal = fixture(:retinal)
    %{retinal: retinal}
  end
end
