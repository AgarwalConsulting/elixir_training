defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  # Please implement the module
  @callback init(opts) :: {:ok, opts} | {:error, error}

  @callback handle_frame(dot, frame_number, opts) :: dot

  defmacro __using__(_opts) do
    quote do
      @behaviour DancingDots.Animation

      def init(opts), do: {:ok, opts}
      defoverridable(init: 1)
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, _opts) when rem(frame_number, 4) == 0 do
    %DancingDots.Dot{dot | opacity: dot.opacity / 2 }
  end

  @impl DancingDots.Animation
  def handle_frame(dot, _frame_number, _opts), do: dot
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init(opts) do
    cond do
      is_integer(opts[:velocity]) ->
        {:ok, opts}
      true ->
        {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(opts[:velocity])}"}
    end
  end

  @impl DancingDots.Animation
  def handle_frame(dot, 1, _opts), do: dot

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, opts) when frame_number > 1 do
    %DancingDots.Dot{dot | radius: dot.radius + (opts[:velocity] * (frame_number - 1)) }
  end
end
