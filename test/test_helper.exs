ExUnit.start()
if Application.get_env(:async_testing, :sandbox_pool_enabled?) do
   Ecto.Adapters.SQL.Sandbox.mode(AsyncTesting.Repo, :manual)
end
