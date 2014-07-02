class HistoricsController < ApplicationController

  def index
    @historics_products = HistoricsProduct.all

    @historics_ingredients = HistoricsIngredient.all
  end

end
