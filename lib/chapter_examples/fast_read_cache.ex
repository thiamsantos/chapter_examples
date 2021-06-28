defmodule ChapterExamples.FastReadCache do
  use GenServer

  def start_link(opts) do
    name = Keyword.fetch!(opts, :name)

    GenServer.start_link(__MODULE__, opts, name: name)
  end

  def init(_opts) do
    {:ok, []}
  end

  def set(name, key, value) do
    :persistent_term.put({__MODULE__, name, key}, value)
  end

  def get(name, key) do
    :persistent_term.get({__MODULE__, name, key}, nil)
  end
end
