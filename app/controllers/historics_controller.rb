class HistoricsController < ApplicationController
    before_filter :check_access


  def index
    @historics_products = HistoricsProduct.all

    @historics_ingredients = HistoricsIngredient.all
  end

end
