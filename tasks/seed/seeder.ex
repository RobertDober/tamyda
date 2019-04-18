defmodule Mix.Tasks.Seed.Seeder do
  alias Tamyda.Repo
  import Tamyda.Data.Resource, only: [create_with_tags: 2]

  @doc """
  seed all resources
  """
  def seed_all do
    create_with_tags( ~w{macOS usb diskutil encrypt},
         short_desc: "format and encrypt USB disk on macOS", url: "https://apple.stackexchange.com/questions/300829/encrypt-external-usb-thumb-drive-on-macos-high-sierra")
    create_with_tags( ~w{elixir phoenix seed ecto},
     short_desc: "access Repo from mix task", long_desc: ~s{assure Repo is started\n`Mix.Task.run "app.start"`}, url: "https://brainlid.org/elixir/2016/09/28/mix-task-using-ecto.html")
  end
end
