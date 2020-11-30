# AsyncTesting

This was tested on Elixir 1.10.4 on OTP version 23. To install:

- [install asdf](https://github.com/asdf-vm/asdf)
- [asdf-elixir](https://github.com/asdf-vm/asdf-elixir)
- [asdf-erlang](https://github.com/asdf-vm/asdf-erlang)
- install erlang: `asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && asdf install erlang 23.1`
- install elixir: `asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && asdf install elixir 1.10.4-otp-23`

You'll also need to install postgres locally or in a docker container and tweak the values in `config/test.exs` accordingly.

You'll need to create and migrate the database to run the tests:
 - MIX_ENV=test mix ecto.create
 - MIX_ENV=test mix ecto.migrate

Run `mix test` to run the tests in the branch you're interested in. This repo is a companion repo to (this article on Medium.]()
