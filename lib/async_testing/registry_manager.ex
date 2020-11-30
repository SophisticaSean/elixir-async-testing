defmodule KV.Registry.Manager do
  @behaviour KV.Behaviours.Registry.Manager

  @impl true
  def get_server() do
    KV.Registry
  end
end
