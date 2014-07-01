class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @ingredients = Ingredient.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @ingredients = @product.ingredients.build(params[:ingredient])
    if @product.save
       # @ingredients_produtcs = @product.ingredients
        redirect_to :action => "show", :id => @product.id
        #redirect_to @product
    else
      @ingredients = Ingredient.all
      render "new"
    end
  end

  def edit
    @ingredients = Ingredient.all
    @product = Product.find(params[:id])
  end

  def update
    @ingredients = Ingredient.all
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to :action => "index"
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to :action => "index"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

private
  def product_params
    params.require(:product).permit(:title, :description, :marge, :ingredients)
  end
end
