# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tamyda.Repo.insert!(%Tamyda.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tamyda.Repo
alias Tamyda.Data.Tag

Repo.insert! %Tag{tag: "elixir"}
Repo.insert! %Tag{tag: "phoenix"}
Repo.insert! %Tag{tag: "dev"}
Repo.insert! %Tag{tag: "git"}
Repo.insert! %Tag{tag: "mix"}
Repo.insert! %Tag{tag: "zsh"}
Repo.insert! %Tag{tag: "tmux"}
Repo.insert! %Tag{tag: "vim"}
