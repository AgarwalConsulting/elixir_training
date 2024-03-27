defmodule Echo do
  def start do
    {:ok, echo_pid} = Task.start fn -> loop() end
    Process.register(echo_pid, :echo)
    echo_pid
  end

  def loop do
    receive do
      {:io_request, caller, reply_as, msg} ->
        IO.inspect msg
        send(caller, {:io_reply, reply_as, msg}) # Refer: https://www.erlang.org/doc/apps/stdlib/io_protocol.html
        loop()
      msg ->
        IO.inspect msg
        loop()
    end
  end
end

Echo.start
# IO.write(:echo, "hello")
