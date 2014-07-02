class CartsController < ApplicationController

  def addToCart
    if !Cart.where(:actif => true).empty?
      cart = Cart.where(:actif => true).last
    else
      cart = Cart.new
      cart.actif = 1
      cart.save
    end

    puts YAML::dump( cart.products )
    cart.products = [Product.find(params[:id])]
    cart.save

    redirect_to :controller => 'products', :action => "index"
  end


  def show
    cart = Cart.where(:actif => true).last
    # @ProductsCarts = ProductsCarts.where(:id_cart => cart.id)
  end

end
