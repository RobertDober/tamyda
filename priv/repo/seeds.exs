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
insert = fn tag -> 
  case Repo.insert(Tag.changeset(%Tag{}, %{tag: tag}), log: false) do
    {:ok, _} -> IO.puts("tag #{tag} inserted")
    {:error, %{errors: errors}} -> IO.puts("#{IO.ANSI.bright}#{IO.ANSI.red}***ERROR:#{IO.ANSI.normal} tag=#{tag}#{IO.ANSI.white} #{inspect errors}")
  end
end
insert.("elixir")
insert.("phoenix")
insert.("dev")
insert.("git")
insert.("mix")
insert.("zsh")
insert.("tmux")
insert.("vim")
