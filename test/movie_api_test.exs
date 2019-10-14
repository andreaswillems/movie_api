defmodule MovieApiTest do
  use ExUnit.Case
  doctest MovieApi

  test "greets the world" do
    assert MovieApi.hello() == :world
  end
end
