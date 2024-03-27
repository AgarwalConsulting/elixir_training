# Processes

- Erlang Process vs OS Processes

- extremely lightweight in terms of memory and CPU

- Processes are isolated from each other, run concurrent to one another and communicate via message passing.

- Processes are not only the basis for concurrency in Elixir, but they also provide the means for building distributed and fault-tolerant programs.

## Spawning Processes

- `spawn`

- `spawn_link`

### Process

- `Process.alive?`

- `self()`

### Sending and receiving messages

- `send`

- `receive do ... end`

- `flush`

## Tasks

- `Task.start`

- `Task.start_link`

Return value enables tasks to be used in supervision trees.

- `Task.async` + `Task.await`

## State

- `Process.register`

- Eg: `send(:kv, {:get, :hello, self()})`

- Using processes to maintain state and name registration are very common patterns in Elixir applications.
