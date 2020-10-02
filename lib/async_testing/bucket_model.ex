defmodule AsyncTesting.Bucket do
  use Ecto.Schema
  require Ecto.Query

  schema "buckets" do
    field :name, :string
    field :value, :string
  end

  def changeset(bucket, params \\ %{}) do
    bucket
    |> Ecto.Changeset.cast(params, [:name, :value])
    |> Ecto.Changeset.validate_required([:name, :value])
    |> Ecto.Changeset.unique_constraint(:name)
  end

  def create(name, value) do
    %AsyncTesting.Bucket{name: name, value: value}
    |> AsyncTesting.Bucket.changeset()
    |> AsyncTesting.Repo.insert()
  end

  def get(name) do
    AsyncTesting.Bucket
    |> Ecto.Query.where(name: ^name)
    |> AsyncTesting.Repo.one()
  end
end
