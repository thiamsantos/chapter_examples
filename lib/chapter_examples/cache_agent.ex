defmodule ChapterExamples.CacheAgent do
  use Agent

  def start_link(opts) do
    name = Keyword.fetch!(opts, :name)

    Agent.start_link(fn -> %{} end, name: name)
  end

  def get(name, key) do
    Agent.get(name, fn cache -> Map.fetch(cache, key) end)
  end

  def set(name, key, value) do
    Agent.update(name, fn cache -> Map.put(cache, key, value) end)
  end
end
