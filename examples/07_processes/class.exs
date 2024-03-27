defmodule Class do
  def start do
    Task.start fn -> loop([]) end
  end

  defp loop(participant_list) do
    receive do
      {:add_participant, participant_name} ->
        loop([participant_name | participant_list])
      {:all_participants, caller} ->
        send(caller, participant_list)
        loop(participant_list)
    end

  end

end

{:ok, class_pid} = Class.start

# send(class_pid, {:add_participant, "Praveen"})
# send(class_pid, {:add_participant, "Gaurav"})
# send(class_pid, {:all_participants, self()})

Process.register(class_pid, :toshiba)
send(:toshiba, {:add_participant, "Praveen"})
