defmodule Tamyda.Repo do
  use Ecto.Repo,
    otp_app: :tamyda,
    adapter: Ecto.Adapters.Postgres
end
