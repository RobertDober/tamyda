defmodule Mix.Tasks.Seed do

  alias Mix.Tasks.Seed.Seeder
  use Mix.Task

  def run(_) do
    Mix.Task.run "app.start"
    IO.puts "seeding"
    Seeder.seed_all
  end
  
end
