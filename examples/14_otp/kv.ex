defmodule SimpleKV do
  use GenServer

  # Client API
  def start_link(default) do
    GenServer.start_link(__MODULE__, default || %{})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def stop(pid) do
    GenServer.stop(pid, :normal)
  end

  ## Server API
  @impl GenServer
  def init(initial_state \\ %{}) do
    {:ok, initial_state}
  end

  @impl GenServer
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  @impl GenServer
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  @impl GenServer
  def terminate(reason, state) do
    :ok
  end
end
