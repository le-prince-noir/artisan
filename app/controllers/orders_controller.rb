class OrdersController < ApplicationController
  before_filter :check_access

  def new
    @order = Order.new
    @cart = Cart.where(:actif => true).last
    @client = Client.all
  end

  def create
    if params[:client] != ""
      @order = Order.new
      @order.cart = Cart.where(:actif => true).last
      client = Client.find(params[:client])
      @order.title = client.firstname+' '+client.lastname
      if @order.save
        self.mail(client)
        redirect_to :action => "show", :id => @order.id
        #redirect_to @order
      else
        render "new"
      end
    else
      flash[:alert] = "Le choix du client est obligatoire !"
      redirect_to :action => "new"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end


  def mail(client)
    ClientMailer.valid_commande(client).deliver
  end

end
