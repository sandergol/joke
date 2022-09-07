defmodule Joke do
  @moduledoc """
  Documentation for `Joke`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Joke.hello()
      :world

  """
  def hello do
    :world
  end

  @spec get_joke :: %{
          :__struct__ => HTTPoison.AsyncResponse | HTTPoison.Response,
          optional(:body) => String.t,
          optional(:headers) => list,
          optional(:id) => reference,
          optional(:request) => HTTPoison.Request.t(),
          optional(:request_url) => String.t,
          optional(:status_code) => integer
        }
  def get_joke do
    HTTPoison.get! "https://api.chucknorris.io/jokes/random"
  end

  @spec print_joke :: Jason | String.t
  def print_joke do
    response_joke = get_joke()
    if response_joke.status_code == 200 do
      response_joke.body |> Jason.decode()
    else
      "Получен некорректный ответ сервера: #{response_joke.status_code}"
    end
  end
end
