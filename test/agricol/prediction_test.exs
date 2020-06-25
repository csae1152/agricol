defmodule Agricol.PredictionTest do
  use Agricol.DataCase

  alias Agricol.Prediction

  describe "images" do
    alias Agricol.Prediction.Image

    @valid_attrs %{description: "some description", image: "some image", name: "some name"}
    @update_attrs %{description: "some updated description", image: "some updated image", name: "some updated name"}
    @invalid_attrs %{description: nil, image: nil, name: nil}

    def image_fixture(attrs \\ %{}) do
      {:ok, image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Prediction.create_image()

      image
    end

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Prediction.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Prediction.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      assert {:ok, %Image{} = image} = Prediction.create_image(@valid_attrs)
      assert image.description == "some description"
      assert image.image == "some image"
      assert image.name == "some name"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prediction.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      assert {:ok, %Image{} = image} = Prediction.update_image(image, @update_attrs)
      assert image.description == "some updated description"
      assert image.image == "some updated image"
      assert image.name == "some updated name"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Prediction.update_image(image, @invalid_attrs)
      assert image == Prediction.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Prediction.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Prediction.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Prediction.change_image(image)
    end
  end
end
