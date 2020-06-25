defmodule AgricolWeb.RetinalController do
  use AgricolWeb, :controller
  alias Agricol.Diagnostics
  alias Agricol.Diagnostics.Retinal

  def index(conn, _params) do
    retinals = Diagnostics.list_retinals()
    render(conn, "index.html", retinals: retinals)
  end

  def new(conn, _params) do
    changeset = Diagnostics.change_retinal(%Retinal{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"retinal" => retinal_params}) do
   case Diagnostics.create_retinal(retinal_params) do
      {:ok, retinal} ->
        conn
        |> put_flash(:info, "Retinal created successfully.")
        |> redirect(to: Routes.retinal_path(conn, :show, retinal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    retinal = Diagnostics.get_retinal!(id)
    render(conn, "show.html", retinal: retinal)
  end

  def edit(conn, %{"id" => id}) do
    retinal = Diagnostics.get_retinal!(id)
    changeset = Diagnostics.change_retinal(retinal)
    render(conn, "edit.html", retinal: retinal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retinal" => retinal_params}) do
    retinal = Diagnostics.get_retinal!(id)

    case Diagnostics.update_retinal(retinal, retinal_params) do
      {:ok, retinal} ->
        conn
        |> put_flash(:info, "Retinal updated successfully.")
        |> redirect(to: Routes.retinal_path(conn, :show, retinal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", retinal: retinal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    retinal = Diagnostics.get_retinal!(id)
    {:ok, _retinal} = Diagnostics.delete_retinal(retinal)

    conn
    |> put_flash(:info, "Retinal deleted successfully.")
    |> redirect(to: Routes.retinal_path(conn, :index))
  end
end
