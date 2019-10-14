defmodule MovieApi.Search do
  @moduledoc false
  require Logger
  @api_key System.fetch_env!("OMDB_API_KEY")

  def search(query) do
    encoded_query = URI.encode(query)
    url = "http://www.omdbapi.com/?s=#{encoded_query}&apikey=#{@api_key}"

    case Tesla.get(url) do
      {:ok, response} ->
        handle_response(response)

      {:error, _reason} ->
        []
    end
  end

  defp handle_response(%{:body => body} = _response) do
    Poison.decode(body)
    |> handle_parsed_body()
    |> handle_search_results()
  end

  defp handle_parsed_body({:ok, map}) do
    map
  end

  defp handle_parsed_body({:error, error}) do
    Logger.error("parsing error")
    IO.inspect(error)
  end

  defp handle_search_results(%{"Search" => results}) do
    results
  end
end
