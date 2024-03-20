defmodule BoutiqueSuggestions do
  @default_budget 100

  def get_combinations(tops, bottoms, options \\ []) do
    tops
      |> Enum.map(fn (top) ->
        bottoms
          |> Stream.filter(fn(bottom) ->
              is_contrasting?(top, bottom) and is_within_budget?(top, bottom, options[:maximum_price])
            end)
          |> Enum.map(fn (bottom) -> {top, bottom} end)
        end)
      |> List.flatten

    # for top <- tops,
    #     bottom <- bottoms,
    #     is_contrasting?(top, bottom) and is_within_budget?(top, bottom, options[:maximum_price]) do
    #   {top, bottom}
    # end
  end

  defp is_contrasting?(top, bottom), do: top.base_color != bottom.base_color
  defp is_within_budget?(top, bottom, budget), do: (top.price + bottom.price) <= (budget || @default_budget)
end
