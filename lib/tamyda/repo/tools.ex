defmodule Tamyda.Repo.Tools do

  defmacro __using__(_options) do
    quote do
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
    IO.puts "injecting into #{__MODULE__}"
      def create(atts) do
        %__MODULE__{}
        |> changeset(atts |> Enum.into(%{}))
        |> Tamyda.Repo.insert
      end
    end
  end
end
