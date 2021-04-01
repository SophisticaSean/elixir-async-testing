defmodule AsyncTesting.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias AsyncTesting.Repo

      import Ecto
      import Ecto.Query
      import AsyncTesting.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    if Application.get_env(:async_testing, :sandbox_pool_enabled?) do
      :ok = Ecto.Adapters.SQL.Sandbox.checkout(AsyncTesting.Repo)
    end

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(AsyncTesting.Repo, {:shared, self()})
    end

    :ok
  end
end
