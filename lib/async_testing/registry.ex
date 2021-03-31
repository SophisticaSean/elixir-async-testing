defmodule KV.Registry do
  use GenServer

  alias Ecto.Adapters.SQL.Sandbox

  @registry_manager Application.compile_env(:mox, :registry_manager, KV.Registry.Manager)

  @doc """
  Starts the registry.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, {:ok, Keyword.get(opts, :test_pid, nil)}, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Returns `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  def lookup(name) do
    GenServer.call(@registry_manager.get_server(), {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  def create(name) do
    GenServer.cast(@registry_manager.get_server(), {:create, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  def get_value(key) do
    GenServer.call(@registry_manager.get_server(), {:get_value, key})
  end

  ## Defining GenServer Callbacks

  @impl true
  def init({:ok, parent_pid}) do
    if parent_pid != nil do
      :ok = Sandbox.allow(AsyncTesting.Repo, parent_pid, self())
    end

    names = %{}
    refs = %{}
    {:ok, {names, refs}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, state) do
    {names, _} = state
    {:reply, Map.fetch(names, name), state}
  end

  @impl true
  def handle_call({:get_value, key}, _from, state) do
    new_bucket = AsyncTesting.Bucket.get(key)
    {:reply, new_bucket, state}
  end

  @impl true
  def handle_cast({:create, name}, {names, refs}) do
    if Map.has_key?(names, name) do
      {:noreply, {names, refs}}
    else
      {:ok, pid} = DynamicSupervisor.start_child(KV.BucketSupervisor, KV.Bucket)
      ref = Process.monitor(pid)
      refs = Map.put(refs, ref, name)
      names = Map.put(names, name, pid)
      {:noreply, {names, refs}}
    end
  end

  @impl true
  def handle_info({:DOWN, ref, :process, _pid, _reason}, {names, refs}) do
    {name, refs} = Map.pop(refs, ref)
    names = Map.delete(names, name)
    {:noreply, {names, refs}}
  end

  @impl true
  def handle_info(_msg, state) do
    {:noreply, state}
  end
end
