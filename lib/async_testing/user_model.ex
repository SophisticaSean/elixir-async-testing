defmodule AsyncTesting.User do
  use AsyncTesting.Schema
  require Ecto.Query

  schema "users" do
    field(:name, :string)
    field(:email, :string)
  end

  def changeset(bucket, params \\ %{}) do
    bucket
    |> Ecto.Changeset.cast(params, [:name, :email])
    |> Ecto.Changeset.validate_required([:name, :email])
    |> Ecto.Changeset.unique_constraint(:email)
  end

  def create(name, email) do
    %AsyncTesting.User{name: name, email: email}
    |> AsyncTesting.User.changeset()
    |> AsyncTesting.Repo.insert()
  end

  def sleep(duration) when is_binary(duration) do
    AsyncTesting.Repo.query!("SELECT pg_sleep(#{duration});")
    :ok
  end

  def sleep(_duration) do
    {:error, :invalid_args}
  end

  def select_one() do
    AsyncTesting.Repo.query!("SELECT 1;")
    :ok
  end

  def get_by_name(name) do
    AsyncTesting.User
    |> Ecto.Query.where(name: ^name)
    |> AsyncTesting.Repo.one()
  end

  def get_by_email(email) do
    AsyncTesting.User
    |> Ecto.Query.where(email: ^email)
    |> AsyncTesting.Repo.one()
  end
end
