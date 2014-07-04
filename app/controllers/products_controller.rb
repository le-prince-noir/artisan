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
    if params[:product][:ingredients] != nil
      params[:product][:ingredients].each do |id_ingredient|
        addIngredients.push(Ingredient.find(id_ingredient))
      end
      @product.ingredients = addIngredients
      # puts YAML::dump( params )

      if @product.image != nil && defined?(@product.image) && (@product.image.original_filename != '')
        @product.image  = @product.save_image(@product.image, @product.title)
      end
      if @product.save
          redirect_to :action => "show", :id => @product.id, :slug => @product.slug
      else
        @ingredients = Ingredient.all
        render "new"
      end
    else
      p "?"
      flash[:alert] = "au moins 1 ingredient est requis"
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
      @product.cleanup
      @product.image  = @product.save_image(params[:product][:image], @product.title)
    end

    # puts YAML::dump( @product )

    if @product.update_attributes(product_params_update)
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
    params.require(:product).permit(:title, :description, :marge, :slug, :image, :ingredients)
  end
  def product_params_update
    params.require(:product).permit(:title, :description, :marge, :slug, :ingredients)
  end


end
