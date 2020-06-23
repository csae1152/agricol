defmodule Agricol.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  alias Agricol.Repo

  alias Agricol.Content.Retina

  @doc """
  Returns the list of post.

  ## Examples

      iex> list_post()
      [%Retina{}, ...]

  """
  def list_post do
    Repo.all(Retina)
  end

  @doc """
  Gets a single retina.

  Raises `Ecto.NoResultsError` if the Retina does not exist.

  ## Examples

      iex> get_retina!(123)
      %Retina{}

      iex> get_retina!(456)
      ** (Ecto.NoResultsError)

  """
  def get_retina!(id), do: Repo.get!(Retina, id)

  @doc """
  Creates a retina.

  ## Examples

      iex> create_retina(%{field: value})
      {:ok, %Retina{}}

      iex> create_retina(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_retina(attrs \\ %{}) do
    %Retina{}
    |> Retina.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a retina.

  ## Examples

      iex> update_retina(retina, %{field: new_value})
      {:ok, %Retina{}}

      iex> update_retina(retina, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_retina(%Retina{} = retina, attrs) do
    retina
    |> Retina.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a retina.

  ## Examples

      iex> delete_retina(retina)
      {:ok, %Retina{}}

      iex> delete_retina(retina)
      {:error, %Ecto.Changeset{}}

  """
  def delete_retina(%Retina{} = retina) do
    Repo.delete(retina)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking retina changes.

  ## Examples

      iex> change_retina(retina)
      %Ecto.Changeset{data: %Retina{}}

  """
  def change_retina(%Retina{} = retina, attrs \\ %{}) do
    Retina.changeset(retina, attrs)
  end
end
