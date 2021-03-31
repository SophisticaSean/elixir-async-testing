import Config

config :logger, :console, level: :warn

config :async_testing, AsyncTesting.Repo,
  url:
    System.get_env(
      "PSQL_URL_TEST",
      "postgres://postgres:postgres@localhost/async_testing_repo_test?sslmode=disable"
    ),
  pool_size: 100,
  pool: Ecto.Adapters.SQL.Sandbox

config :mox, :registry_manager, KV.Registry.ManagerMock

config :async_testing,
  ecto_loop_count: 10,
  timer_sleep_loop_count: 1000
