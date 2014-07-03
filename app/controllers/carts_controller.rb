class CartsController < ApplicationController
  before_filter :check_access, :only => [:add_to_cart, :show]


  def add_to_cart
    if !Cart.where(:actif => true).empty?
      cart = Cart.where(:actif => true).last
    else
      cart = Cart.new
      cart.actif = 1
      cart.save
    end
    # puts YAML::dump( params[:id] )
    if cart.carts_products.map(&:product_id).include?(params[:id].to_i)
      c = cart.carts_products.where(:product_id => params[:id]).last
      c.quantity = c.quantity + 1
      c.save
    else
      cart.products << [Product.find(params[:id])]
    end
    cart.save

    redirect_to :controller => 'products', :action => "index"
  end


  def destroy
    cart = Cart.where(:actif => true).last
    puts YAML::dump( cart.carts_products )
    if cart.carts_products.find(params[:id]).destroy
      redirect_to :action => "show"
    end
  end

  def removeOne
    cart = Cart.where(:actif => true).last
    puts YAML::dump( cart.carts_products )
    cart.carts_products.find(params[:id]).remove_one
    redirect_to :action => "show"
  end

  def show
    @cart = Cart.where(:actif => true).last
    @client = Client.all
    @order = Order.new
    # @ProductsCarts = ProductsCarts.where(:id_cart => cart.id)
  end

end
