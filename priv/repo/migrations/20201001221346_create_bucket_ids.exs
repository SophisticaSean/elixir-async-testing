defmodule AsyncTesting.Repo.Migrations.CreateBucketIds do
  use Ecto.Migration

  def change do
     create table(:buckets) do
      add :name, :string
      add :value, :string
    end

    create index(:buckets, [:name], unique: true)
  end
end
