people = [%{:name => "Gaurav", :age => 32}, %{:name => "Bhautik"}]

put_in Enum.at(people, 1)[:skill], :elixir # Doesn't update the entire strucutre

gaurav = %{:name => "Gaurav", :age => 32, :skill => [
  :elixir,
  :go,
]}

update_in gaurav[:skill], fn skill_list -> skill_list -- [:go] end
