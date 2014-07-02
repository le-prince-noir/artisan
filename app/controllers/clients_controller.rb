#http://mlamarque.github.io/presentations/Rails/#/12
#http://www.tutoriaux-rails.com/articles/inscription-et-connexion-d-un-utilisateur-avec-authlogic/

class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to :action => "show", :id => @client.id
      #redirect_to @client
    else
      render "new"
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to :action => "index"
    else
      render "edit"
    end
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      redirect_to :action => "index"
    end
  end

  def show
    @client = Client.find(params[:id])
  end

private
  def client_params
    params.require(:client).permit(:lastname, :firstname, :email, :tel, :address)
  end
end
