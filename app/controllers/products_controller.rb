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

    addIngredients = [];

    params[:product][:ingredients].each do |id_ingredient|
      addIngredients.push(Ingredient.find(id_ingredient))
    end
    @product.ingredients = addIngredients
    if @product.save
        redirect_to :action => "show", :id => @product.id
    else
      @ingredients = Ingredient.all
      render "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @product = Product.find(params[:id])
    addIngredients = [];

    if params[:product][:ingredients]
      params[:product][:ingredients].each do |id_ingredient|
        addIngredients.push(Ingredient.find(id_ingredient))
    end
      @product.ingredients = addIngredients
    else
      @product.ingredients = addIngredients
    end
    # puts YAML::dump(  )
    if @product.update(product_params)
      redirect_to :action => "index"
    else
      @ingredients = Ingredient.all
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
    params.require(:product).permit(:title, :description, :marge, :slug,:image, :ingredients)
  end
end
