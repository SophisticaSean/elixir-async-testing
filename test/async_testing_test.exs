defmodule AsyncTestingTest do
  use AsyncTesting.RepoCase, async: false
  doctest AsyncTesting

  test "greets the world" do
    assert AsyncTesting.hello() == :world
  end

  test "can create a bucket" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)

    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    :ok = KV.Registry.create(KV.Registry, bucket_id)

    assert {:ok, ^bucket} = KV.Registry.lookup(KV.Registry, bucket_id)
  end

  test "can put into bucket 1" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 12)
    out = KV.Bucket.get(bucket, "hello")
    assert "12" = out.value
  end
  test "can put into bucket 2" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 13)
    out = KV.Bucket.get(bucket, "hello")
    assert "13" = out.value
  end
  test "can put into bucket 3" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 14)
    out = KV.Bucket.get(bucket, "hello")
    assert "14" = out.value
  end
  test "can put into bucket 4" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 15)
    out = KV.Bucket.get(bucket, "hello")
    assert "15" = out.value
  end
  test "can put into bucket 5" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 16)
    out = KV.Bucket.get(bucket, "hello")
    assert "16" = out.value
  end
  test "can put into bucket 6" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 17)
    out = KV.Bucket.get(bucket, "hello")
    assert "17" = out.value
  end
  test "can put into bucket 7" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 18)
    out = KV.Bucket.get(bucket, "hello")
    assert "18" = out.value
  end
  test "can put into bucket 8" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 19)
    out = KV.Bucket.get(bucket, "hello")
    assert "19" = out.value
  end
  test "can put into bucket 9" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 20)
    out = KV.Bucket.get(bucket, "hello")
    assert "20" = out.value
  end
  test "can put into bucket 10" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 21)
    out = KV.Bucket.get(bucket, "hello")
    assert "21" = out.value
  end
  test "can put into bucket 11" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 22)
    out = KV.Bucket.get(bucket, "hello")
    assert "22" = out.value
  end
  test "can put into bucket 12" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 23)
    out = KV.Bucket.get(bucket, "hello")
    assert "23" = out.value
  end
  test "can put into bucket 13" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 24)
    out = KV.Bucket.get(bucket, "hello")
    assert "24" = out.value
  end
  test "can put into bucket 14" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 25)
    out = KV.Bucket.get(bucket, "hello")
    assert "25" = out.value
  end
  test "can put into bucket 15" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 26)
    out = KV.Bucket.get(bucket, "hello")
    assert "26" = out.value
  end
  test "can put into bucket 16" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 27)
    out = KV.Bucket.get(bucket, "hello")
    assert "27" = out.value
  end
  test "can put into bucket 17" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 28)
    out = KV.Bucket.get(bucket, "hello")
    assert "28" = out.value
  end
  test "can put into bucket 18" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 29)
    out = KV.Bucket.get(bucket, "hello")
    assert "29" = out.value
  end
  test "can put into bucket 19" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 30)
    out = KV.Bucket.get(bucket, "hello")
    assert "30" = out.value
  end
  test "can put into bucket 20" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 31)
    out = KV.Bucket.get(bucket, "hello")
    assert "31" = out.value
  end
  test "can put into bucket 21" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 32)
    out = KV.Bucket.get(bucket, "hello")
    assert "32" = out.value
  end
  test "can put into bucket 22" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 33)
    out = KV.Bucket.get(bucket, "hello")
    assert "33" = out.value
  end
  test "can put into bucket 23" do
    bucket_id = Ecto.UUID.generate()
    :ok = KV.Registry.create(KV.Registry, bucket_id)
    {:ok, bucket} = KV.Registry.lookup(KV.Registry, bucket_id)

    assert {:ok, _bucket} = KV.Bucket.put(bucket, "hello", 34)
    out = KV.Bucket.get(bucket, "hello")
    assert "34" = out.value
  end
end
