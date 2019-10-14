defmodule MovieApi do
  @moduledoc """
  Documentation for MovieApi.
  """

  defdelegate search(query), to: MovieApi.Search
end
