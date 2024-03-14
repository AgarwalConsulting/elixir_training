defmodule Summer do
  def summer do
    sum = 0
    fn x -> sum = sum + x; sum end
  end
end
