defmodule AgricolWeb.RetinaController do
  use AgricolWeb, :controller

  alias Agricol.Content
  alias Agricol.Content.Retina

  def index(conn, _params) do
    post = Content.list_post()
    render(conn, "index.html", post: post)
  end

  def new(conn, _params) do
    changeset = Content.change_retina(%Retina{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"retina" => retina_params}) do
    case Content.create_retina(retina_params) do
      {:ok, retina} ->
        conn
        |> put_flash(:info, "Retina created successfully.")
        |> redirect(to: Routes.retina_path(conn, :show, retina))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    retina = Content.get_retina!(id)
    render(conn, "show.html", retina: retina)
  end

  def edit(conn, %{"id" => id}) do
    retina = Content.get_retina!(id)
    changeset = Content.change_retina(retina)
    render(conn, "edit.html", retina: retina, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retina" => retina_params}) do
    retina = Content.get_retina!(id)

    case Content.update_retina(retina, retina_params) do
      {:ok, retina} ->
        conn
        |> put_flash(:info, "Retina updated successfully.")
        |> redirect(to: Routes.retina_path(conn, :show, retina))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", retina: retina, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    retina = Content.get_retina!(id)
    {:ok, _retina} = Content.delete_retina(retina)

    conn
    |> put_flash(:info, "Retina deleted successfully.")
    |> redirect(to: Routes.retina_path(conn, :index))
  end
end
