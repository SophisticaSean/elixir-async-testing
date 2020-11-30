import Config

config :async_testing, AsyncTesting.Repo,
  database: "async_testing_repo",
  username: "postgres",
  password: "password",
  hostname: "0.0.0.0",
  port: 5433

config :async_testing, ecto_repos: [AsyncTesting.Repo]
