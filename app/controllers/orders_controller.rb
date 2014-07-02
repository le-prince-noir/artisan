class OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart = Cart.where(:actif => true).last
    @client = Client.all
  end

  def create
    @order = Order.new
    puts YAML::dump( @order.cart )
    @order.cart = Cart.where(:actif => true).last
    @order.client = Client.find(params[:client])
    if @order.save
      redirect_to :action => "show", :id => @order.id
      #redirect_to @order
    else
      render "new"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end

end
