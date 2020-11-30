defmodule KV.Behaviours.Registry.Manager do
  @callback get_server() :: atom() | pid()
end
