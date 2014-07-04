#http://mlamarque.github.io/presentations/Rails/#/12
#http://www.tutoriaux-rails.com/articles/inscription-et-connexion-d-un-utilisateur-avec-authlogic/

class IngredientsController < ApplicationController
  before_filter :check_access, :only => [:new, :create, :edit, :update, :destroy, :show]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    # puts YAML::dump( params[:image] )

    if @ingredient.image != nil && defined?(@ingredient.image) && (@ingredient.image.original_filename != '')
      @ingredient.image = @ingredient.save_image(@ingredient.image, @ingredient.title)
    end
    if @ingredient.save
      flash[:notice] = "L'ingredient a bien été ajouté !"
      redirect_to :action => "show", :id => @ingredient.id , :slug => @ingredient.slug
      #redirect_to @ingredient
    else
      render "new"
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    # puts YAML::dump( params[:ingredient][:image] )

    if params[:ingredient][:image]
      @ingredient.cleanup
      @ingredient.image = @ingredient.save_image(params[:ingredient][:image], @ingredient.title)
    end

    if @ingredient.update(ingredient_params_update)
      flash[:notice] = "L'ingredient a bien été modifié !"
      redirect_to :action => "index"
    else
      render "edit"
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      redirect_to :action => "index"
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

private
  def ingredient_params
    params.require(:ingredient).permit(:title, :description, :price, :slug, :image)
  end
  def ingredient_params_update
    params.require(:ingredient).permit(:title, :description, :price, :slug)
  end
end
