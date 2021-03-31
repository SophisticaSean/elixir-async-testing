import Config

config :async_testing, AsyncTesting.Repo,
  migration_primary_key: [type: :uuid, default: {:fragment, "public.gen_random_uuid()"}],
  migration_timestamps: [type: :timestamptz],
  url:
    System.get_env(
      "PSQL_URL_TEST",
      "postgres://postgres:postgres@localhost/async_testing_repo_test?sslmode=disable"
    ),
  pool_size: 10

config :async_testing, ecto_repos: [AsyncTesting.Repo]

import_config "#{Mix.env()}.exs"
