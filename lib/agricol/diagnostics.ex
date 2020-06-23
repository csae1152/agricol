defmodule Agricol.Diagnostics do
  @moduledoc """
  The Diagnostics context.
  """

  import Ecto.Query, warn: false
  alias Agricol.Repo

  alias Agricol.Diagnostics.Retinal

  @doc """
  Returns the list of retinals.

  ## Examples

      iex> list_retinals()
      [%Retinal{}, ...]

  """
  def list_retinals do
    Repo.all(Retinal)
  end

  @doc """
  Gets a single retinal.

  Raises `Ecto.NoResultsError` if the Retinal does not exist.

  ## Examples

      iex> get_retinal!(123)
      %Retinal{}

      iex> get_retinal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_retinal!(id), do: Repo.get!(Retinal, id)

  @doc """
  Creates a retinal.

  ## Examples

      iex> create_retinal(%{field: value})
      {:ok, %Retinal{}}

      iex> create_retinal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_retinal(attrs \\ %{}) do
    %Retinal{}
    |> Retinal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a retinal.

  ## Examples

      iex> update_retinal(retinal, %{field: new_value})
      {:ok, %Retinal{}}

      iex> update_retinal(retinal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_retinal(%Retinal{} = retinal, attrs) do
    retinal
    |> Retinal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a retinal.

  ## Examples

      iex> delete_retinal(retinal)
      {:ok, %Retinal{}}

      iex> delete_retinal(retinal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_retinal(%Retinal{} = retinal) do
    Repo.delete(retinal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking retinal changes.

  ## Examples

      iex> change_retinal(retinal)
      %Ecto.Changeset{data: %Retinal{}}

  """
  def change_retinal(%Retinal{} = retinal, attrs \\ %{}) do
    Retinal.changeset(retinal, attrs)
  end
end
