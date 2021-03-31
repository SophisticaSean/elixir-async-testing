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

## Running the tests
 - First, get a proper connection string configured in your ENV:
   - `export PSQL_URL_DEV=postgres://postgres:postgres@0.0.0.0:5432/async_testing_repo_dev?sslmode=disable`
   - `export PSQL_URL_TEST=postgres://postgres:postgres@0.0.0.0:5432/async_testing_repo_test?sslmode=disable`
 - Create and migrate your database:
   - `mix ecto.reset`
 - Run the tests normally:
   - `time mix test`
 - Run the tests in parallel:
   - use this bash function:
     ```
     function run_tests {
       unset pids
       MIX_ENV=test mix compile
       start=$(date +%s.%N)
       for i in {1..$1}; do
           MIX_TEST_PARTITION=${i} mix test --partitions $1 &
           pids[${i}]=$!
       done
       for pid in ${pids[*]}; do
         wait $pid;
       done
       dur=$(echo "$(date +%s.%N) - $start" | bc)
       printf "Execution time: %.6f seconds\n" $dur
     };
```
  - run_tests 4 (argument is the number of parallel mix test partitions to run)
 - Tweak the `loop_count` variables in config/test.exs to compare ecto vs timer.sleep workload simulation.
