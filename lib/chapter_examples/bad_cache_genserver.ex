defmodule ChapterExamples.BadCacheGenServer do
  use GenServer

  def start_link(opts) do
    name = Keyword.fetch!(opts, :name)

    GenServer.start_link(__MODULE__, opts, name: name)
  end

  def init(opts) do
    name = Keyword.fetch!(opts, :name)

    :ets.new(table_name(name), [:set, :named_table])

    {:ok, %{name: name}}
  end

  def set(name, key, value) do
    GenServer.call(name, {:set, key, value})
  end

  def get(name, key) do
    GenServer.call(name, {:get, key})
  end

  def handle_call({:set, key, value}, _from, state) do
    :ets.insert(table_name(state.name), {key, value})

    {:reply, :ok, state}
  end

  def handle_call({:get, key}, _from, state) do
    case :ets.lookup(table_name(state.name), key) do
      [{^key, value}] -> {:reply, {:ok, value}, state}
      _ -> {:reply, {:error, :not_found}, state}
    end
  end

  defp table_name(name), do: Module.concat(name, "Table")
end
