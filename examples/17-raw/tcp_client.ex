{:ok, sock} = :gen_tcp.connect('127.0.0.1', 5678, [:binary, {:packet, 0},
{:active, false}])

:ok = :gen_tcp.send(sock, 'Some Data')

{:ok, reply} = :gen_tcp.recv(sock, 0)

IO.inspect reply

:ok = :gen_tcp.close(sock)
