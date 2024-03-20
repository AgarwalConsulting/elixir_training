defmodule Example do
  def send(pid) do
    Kernel.send pid, {:recognized, self()}
    Kernel.send pid, {:not_recognized, self()}
    Kernel.send pid, {:recognized, self()}
  end
end

defmodule Receiver do
  def loop(key \\ :recognized, n)
  def loop(_key, 0), do: :ok

  def loop(key, n) do
    receive do
      {^key, pid} ->
        IO.inspect pid
        loop(n - 1)
    end
  end
end

# my_pid = self()

# IO.inspect my_pid

# my_pid = self()
# spawn fn -> Example.send(my_pid) end
# Task.start fn -> Example.send(my_pid) end

# Receiver.loop(2)
# Receiver.loop(:not_recognized, 1)

# Receiver.loop(1)
