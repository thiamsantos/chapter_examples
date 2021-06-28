defmodule ChapterExamplesTest do
  use ExUnit.Case
  doctest ChapterExamples

  test "greets the world" do
    assert ChapterExamples.hello() == :world
  end
end
