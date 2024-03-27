defmodule CookingRecipe do
  defstruct [:steps, :ingredients]

  defmacro ingredient(recipe, ingredients) do
    quote do
      %CookingRecipe{unquote(recipe) | ingredients: [unquote(ingredients)]}
    end
  end
end

# require CookingRecipe
# # import CookingRecipe, only: ingredient

# recipe = %CookingRecipe{}

# recipe |>
#   CookingRecipe.ingredient "Rice", "Moong Dal", "Water", "Salt"

  # |> step 1 "Add water to pan" |> step 2 ""
