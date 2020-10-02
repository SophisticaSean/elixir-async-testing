defmodule AsyncTesting.Repo do
  use Ecto.Repo,
    otp_app: :async_testing,
    adapter: Ecto.Adapters.Postgres
end
