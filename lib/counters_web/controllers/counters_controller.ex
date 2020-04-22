defmodule CountersWeb.CountersController do
  use CountersWeb, :controller

  alias Counters.CountersRepository

  def show(conn, %{"counter_name" => counter_name}) do
    counter_value = CountersRepository.current_value(counter_name)
    json(conn, %{counter_name: counter_name, counter_value: counter_value})
  end

  def post(conn, %{"counter_name" => counter_name}) do
    CountersRepository.increment(counter_name)
    counter_value = CountersRepository.current_value(counter_name)
    json(conn, %{counter_name: counter_name, counter_value: counter_value})
  end
end
