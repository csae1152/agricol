defmodule Agricol.DiagnosticsTest do
  use Agricol.DataCase

  alias Agricol.Diagnostics

  describe "retinals" do
    alias Agricol.Diagnostics.Retinal

    @valid_attrs %{description: "some description", retinaimage: "some retinaimage", timestamps: "some timestamps"}
    @update_attrs %{description: "some updated description", retinaimage: "some updated retinaimage", timestamps: "some updated timestamps"}
    @invalid_attrs %{description: nil, retinaimage: nil, timestamps: nil}

    def retinal_fixture(attrs \\ %{}) do
      {:ok, retinal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Diagnostics.create_retinal()

      retinal
    end

    test "list_retinals/0 returns all retinals" do
      retinal = retinal_fixture()
      assert Diagnostics.list_retinals() == [retinal]
    end

    test "get_retinal!/1 returns the retinal with given id" do
      retinal = retinal_fixture()
      assert Diagnostics.get_retinal!(retinal.id) == retinal
    end

    test "create_retinal/1 with valid data creates a retinal" do
      assert {:ok, %Retinal{} = retinal} = Diagnostics.create_retinal(@valid_attrs)
      assert retinal.description == "some description"
      assert retinal.retinaimage == "some retinaimage"
      assert retinal.timestamps == "some timestamps"
    end

    test "create_retinal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Diagnostics.create_retinal(@invalid_attrs)
    end

    test "update_retinal/2 with valid data updates the retinal" do
      retinal = retinal_fixture()
      assert {:ok, %Retinal{} = retinal} = Diagnostics.update_retinal(retinal, @update_attrs)
      assert retinal.description == "some updated description"
      assert retinal.retinaimage == "some updated retinaimage"
      assert retinal.timestamps == "some updated timestamps"
    end

    test "update_retinal/2 with invalid data returns error changeset" do
      retinal = retinal_fixture()
      assert {:error, %Ecto.Changeset{}} = Diagnostics.update_retinal(retinal, @invalid_attrs)
      assert retinal == Diagnostics.get_retinal!(retinal.id)
    end

    test "delete_retinal/1 deletes the retinal" do
      retinal = retinal_fixture()
      assert {:ok, %Retinal{}} = Diagnostics.delete_retinal(retinal)
      assert_raise Ecto.NoResultsError, fn -> Diagnostics.get_retinal!(retinal.id) end
    end

    test "change_retinal/1 returns a retinal changeset" do
      retinal = retinal_fixture()
      assert %Ecto.Changeset{} = Diagnostics.change_retinal(retinal)
    end
  end
end
