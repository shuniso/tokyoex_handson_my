ExUnit.start

Mix.Task.run "ecto.create", ~w(-r TokyoexHandsonMy.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r TokyoexHandsonMy.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(TokyoexHandsonMy.Repo)

