m = %{}

# cm_emp = m["CoderMana"]
# cm_emp = (cm_emp || []) ++ ["G A"]
# Map.put m, "CoderMana", cm_emp

# (or)

m = update_in m, ["CoderMana"], fn (cm_emp) -> (cm_emp || []) ++ ["G A"] end
# update_in m, ["CoderMana"], fn (cm_emp) -> ["G A" | (cm_emp || [])] end

# ---

m = %{
  "Toshiba" => ["Bhautik", "Saraswati", "Nagaraj"],
  "CoderMana" => ["Gaurav"],
}

m = update_in m, ["CoderMana"], fn (cm_emp) -> (cm_emp ++ ["G A"]) end
