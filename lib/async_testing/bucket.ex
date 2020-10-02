defmodule KV.Bucket do
  use Agent, restart: :temporary


  @doc """
  Starts a new bucket.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`.
  """
  def get(bucket, key) do
    :timer.sleep(200)
    case Agent.get(bucket, &Map.get(&1, key)) do
      nil ->
        #new_bucket = AsyncTesting.Bucket.get(key)
        new_bucket = KV.Registry.get_value(key)
        Agent.update(bucket, &Map.put(&1, key, new_bucket.value))
        new_bucket
      value ->
        value
    end
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`.
  """
  def put(bucket, key, value) when is_integer(value) do
    put(bucket, key, to_string(value))
  end
  def put(_bucket, key, value) when is_binary(value) do
    :timer.sleep(200)
    #Agent.update(bucket, &Map.put(&1, key, value))
    AsyncTesting.Bucket.create(key, value)
  end
end

