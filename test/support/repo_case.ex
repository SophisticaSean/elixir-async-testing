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
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(AsyncTesting.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(AsyncTesting.Repo, {:shared, self()})
    end

    :ok
  end
end
