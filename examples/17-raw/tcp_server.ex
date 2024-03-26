{:ok, lsock} = :gen_tcp.listen(5678, [:binary, {:packet, 0},
{:active, false}])

for _i <- Stream.cycle([1]) do
  {:ok, client} = :gen_tcp.accept(lsock)

  spawn_link fn ->
    {:ok, client_data} = :gen_tcp.recv(client, 0)

    IO.inspect client_data
    :ok = :gen_tcp.send(client, 'Ack!')
  end
end
