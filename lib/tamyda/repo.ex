defmodule Tamyda.Repo do
  use Ecto.Repo,
    otp_app: :tamyda,
    adapter: Ecto.Adapters.Postgres

  import Ecto.Query

  @doc """
  convenience method like AR's _Model_.last
  """
  def last(schema) do
    from(q in schema, order_by: [desc: :id], limit: 1)
    |> one()
  end

  @doc """
  convenience method like AR's _Model_.ids.last
  """
  def last_id(schema) do
    from(q in schema, order_by: [desc: :id], limit: 1, select: q.id)
    |> one()
  end
end
