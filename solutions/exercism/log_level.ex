defmodule LogLevel do
  def to_label(level, legacy?) do
    case {level, legacy?} do
      {0, false} -> :trace
      {1, _} -> :debug
      {2, _} -> :info
      {3, _} -> :warning
      {4, _} -> :error
      {5, false} -> :fatal
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case {to_label(level, legacy?), legacy?} do
      {:error, _} -> :ops
      {:fatal, _} -> :ops
      {:unknown, true} -> :dev1
      {:unknown, false} -> :dev2
      _ -> :false
    end
  end
end


# Use the `LogLevel.to_label/2` function from the previous task. If the log label is _error_ or _fatal_, send the alert to the _ops_ team. If you receive a log with an _unknown_ label from a legacy system, send the alert to the _dev1_ team, other unknown labels should be sent to the _dev2_ team. All other log labels can be safely ignored by returning _false_.

# | Log code              | Log label | Supported in legacy apps? |
# |-----------------------| --------- | ------------------------- |
# | 0                     | trace     | no                        |
# | 1                     | debug     | yes                       |
# | 2                     | info      | yes                       |
# | 3                     | warning   | yes                       |
# | 4                     | error     | yes                       |
# | 5                     | fatal     | no                        |
# | other / not supported | unknown   | -                         |
