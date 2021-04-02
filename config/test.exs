import Config

config :logger, :console, level: :warn

config :async_testing, AsyncTesting.Repo,
  url:
    System.get_env(
      "PSQL_URL_TEST",
      "postgres://postgres:postgres@localhost/async_testing_repo_test?sslmode=disable"
    ),
  pool_size: 1,
  timeout: 60_000
  #pool: Ecto.Adapters.SQL.Sandbox

config :mox, :registry_manager, KV.Registry.ManagerMock

config :async_testing,
  sandbox_pool_enabled?: false,
  ecto_user_create_loop_count: 1,
  ecto_user_sleep_duration: "0.001",
  ecto_user_sleep_loop_count: 1,
  ecto_user_select_1_loop_count: 1,
  manual_postgrex_loop_count: 5000,
  timer_sleep_loop_count: 1
