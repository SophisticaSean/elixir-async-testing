defmodule AsyncTestingTest41 do
  use AsyncTesting.RepoCase, async: true
  doctest AsyncTesting

  alias AsyncTesting.User

  setup do
    registry = start_supervised!({KV.Registry, name: __MODULE__, test_pid: self()})
    Hammox.stub(KV.Registry.ManagerMock, :get_server, fn -> registry end)

    :ok
  end

  test "greets the world" do
    assert AsyncTesting.hello() == :world
  end

  test "can create a bucket" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(bucket_id)

    {:ok, bucket} = KV.Registry.lookup(bucket_id)

    :ok = KV.Registry.create(bucket_id)

    assert {:ok, ^bucket} = KV.Registry.lookup(bucket_id)
  end

  test "can put into bucket 1" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(bucket_id)
    {:ok, bucket} = KV.Registry.lookup(bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello#{bucket_id}", 12)
    out = KV.Bucket.get(bucket, "hello#{bucket_id}")
    assert "12" = out.value
  end

  test "complex bucket test" do
    Enum.each(1..100, fn _x ->
      bucket_id = Ecto.UUID.generate()
      :ok = KV.Registry.create(bucket_id)

      {:ok, bucket} = KV.Registry.lookup(bucket_id)

      :ok = KV.Registry.create(bucket_id)

      assert {:ok, ^bucket} = KV.Registry.lookup(bucket_id)
    end)
  end

  test "complex ecto user test" do
    loop_count = Application.get_env(:async_testing, :ecto_loop_count)

    AsyncTesting.Repo.checkout(fn ->
      Enum.each(1..loop_count, fn x ->
        email = Ecto.UUID.generate()
        name = "Tim#{x}"
        {:ok, user} = User.create(name, email)
        assert user.name == name
        assert user.email == email

        user = User.get_by_email(email)
        assert user.name == name
        assert user.email == email
      end)
    end)
  end

  test "complex timer sleep test" do
    loop_count = Application.get_env(:async_testing, :timer_sleep_loop_count)

    Enum.each(1..loop_count, fn x ->
      email = Ecto.UUID.generate()
      name = "Tim#{x}"
      assert is_binary(email)
      assert is_binary(name)
      :timer.sleep(6)
      email = Ecto.UUID.generate()
      name = "Tim#{x}"
      assert is_binary(email)
      assert is_binary(name)
    end)
  end
end
