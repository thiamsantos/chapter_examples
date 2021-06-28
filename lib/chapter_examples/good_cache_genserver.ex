defmodule ChapterExamples.GoodCacheGenServer do
  use GenServer

  def start_link(opts) do
    name = Keyword.fetch!(opts, :name)

    GenServer.start_link(__MODULE__, opts, name: name)
  end

  def init(opts) do
    name = Keyword.fetch!(opts, :name)

    :ets.new(table_name(name), [:set, :named_table, :protected, read_concurrency: true])

    {:ok, %{name: name}}
  end

  def set(name, key, value) do
    GenServer.call(name, {:set, key, value})
  end

  def get(name, key) do
    case :ets.lookup(table_name(name), key) do
      [{^key, value}] -> {:ok, value}
      _ -> {:error, :not_found}
    end
  end

  def handle_call({:set, key, value}, _from, state) do
    :ets.insert(table_name(state.name), {key, value})

    {:reply, :ok, state}
  end

  defp table_name(name), do: Module.concat(name, "Table")
end
