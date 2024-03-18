m = %{:name => "Gaurav", 32 => :age}

m = %{:name => "Gaurav", :age => 32}
m = %{name: "Gaurav", age: 32}

put_in m[:age], 33

m = %{}
