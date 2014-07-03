class ProductsController < ApplicationController
    before_filter :check_access, :only => [:new, :create, :edit, :update, :destroy]

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
    # puts YAML::dump( params )

    if defined?(@product.image) && (@product.image.original_filename != '')
      @product.image  = @product.save_image(@product.image, @product.title)
    end
    if @product.save
        redirect_to :action => "show", :id => @product.id, :slug => @product.slug
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

    if params[:product][:image]
      @product.image  = @product.save_image(params[:product][:image], @product.title)
    end

    # if defined?(@product.image_hidden) && @product.image_hidden.empty? && defined?(@product.image)
    #   @product.save_image(@product.image)
    #   @product.image = @product.image.original_filename
    # end

    # puts YAML::dump( params[:product][:id] )
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
