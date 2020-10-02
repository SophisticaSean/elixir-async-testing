import Config

config :async_testing, AsyncTesting.Repo,
  database: "async_testing_repo_test",
  username: "postgres",
  password: "password",
  hostname: "0.0.0.0",
  port: 5433,
  pool: Ecto.Adapters.SQL.Sandbox

