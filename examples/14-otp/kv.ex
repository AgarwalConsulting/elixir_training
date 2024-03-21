defmodule SimpleKV do
  use GenServer

  # Client API
  def start_link(default) do
    GenServer.start_link(__MODULE__, default || %{})
  end

  def get(pid, key) do
    GenServer.cast(pid, {:get, key})
  end

  def set(pid, key, value) do
    GenServer.call(pid, {:set, key, value})
  end

  ## Server API
  @impl GenServer
  def init(initial_state \\ %{}) do
    {:ok, initial_state}
  end

  @impl GenServer
  def handle_cast({:set, key, value}, state) do
    {:no_reply, Map.put(state, key, value)}
  end

  @impl GenServer
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
end
