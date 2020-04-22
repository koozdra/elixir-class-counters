defmodule Counters.CountersRepository do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def current_value(counter_name) do
    Agent.get(__MODULE__, fn counters_repository ->
      Map.get(counters_repository, counter_name, 0)
    end)
  end

  def increment(counter_name) do
    Agent.update(__MODULE__, fn counters_repository ->
      with {:ok, current_value} <- Map.fetch(counters_repository, counter_name) do
        put_in(counters_repository, [counter_name], current_value + 1)
      else
        _ -> put_in(counters_repository, [counter_name], 1)
      end
    end)
  end
end
