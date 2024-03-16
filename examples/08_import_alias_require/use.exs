# defmodule AssertionTest do
#   use ExUnit.Case, async: true

#   test "always pass" do
#     assert true
#   end
# end

# ---

defmodule Example do
  use Feature, option: :value
end

# defmodule Example do
#   require Feature
#   Feature.__using__(option: :value)
# end
