defmodule Agricol.ContentTest do
  use Agricol.DataCase

  alias Agricol.Content

  describe "post" do
    alias Agricol.Content.Retina

    @valid_attrs %{content: "some content", is_published: true, title: "some title"}
    @update_attrs %{content: "some updated content", is_published: false, title: "some updated title"}
    @invalid_attrs %{content: nil, is_published: nil, title: nil}

    def retina_fixture(attrs \\ %{}) do
      {:ok, retina} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_retina()

      retina
    end

    test "list_post/0 returns all post" do
      retina = retina_fixture()
      assert Content.list_post() == [retina]
    end

    test "get_retina!/1 returns the retina with given id" do
      retina = retina_fixture()
      assert Content.get_retina!(retina.id) == retina
    end

    test "create_retina/1 with valid data creates a retina" do
      assert {:ok, %Retina{} = retina} = Content.create_retina(@valid_attrs)
      assert retina.content == "some content"
      assert retina.is_published == true
      assert retina.title == "some title"
    end

    test "create_retina/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_retina(@invalid_attrs)
    end

    test "update_retina/2 with valid data updates the retina" do
      retina = retina_fixture()
      assert {:ok, %Retina{} = retina} = Content.update_retina(retina, @update_attrs)
      assert retina.content == "some updated content"
      assert retina.is_published == false
      assert retina.title == "some updated title"
    end

    test "update_retina/2 with invalid data returns error changeset" do
      retina = retina_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_retina(retina, @invalid_attrs)
      assert retina == Content.get_retina!(retina.id)
    end

    test "delete_retina/1 deletes the retina" do
      retina = retina_fixture()
      assert {:ok, %Retina{}} = Content.delete_retina(retina)
      assert_raise Ecto.NoResultsError, fn -> Content.get_retina!(retina.id) end
    end

    test "change_retina/1 returns a retina changeset" do
      retina = retina_fixture()
      assert %Ecto.Changeset{} = Content.change_retina(retina)
    end
  end
end
