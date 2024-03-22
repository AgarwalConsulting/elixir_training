# Creating OS-level child processes

port = Port.open({:spawn, "cat"}, [:binary])

send(port, {self(), {:command, "hello"}})
send(port, {self(), {:command, "world"}})

flush()

Port.close port

# ---

System.cmd("echo", ["hello"])
