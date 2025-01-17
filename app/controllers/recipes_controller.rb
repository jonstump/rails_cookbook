class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
    @categories = Category.all
    @ingredients = Ingredient.all
    render :index
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
    @ingredients = Ingredient.all
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @categories = Category.all
    @ingredients = Ingredient.all
    if @recipe.save
      if params[:category_selection].to_i != 0
        category = Category.find(params[:category_selection].to_i)
        category.recipes << @recipe
      end
      if params[:ingredient_selection].to_i != 0
        ingredient = Ingredient.find(params[:ingredient_selection].to_i)
        ingredient.recipes << @recipe
      end
      flash[:notice] = "Recipe successfully added!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all
    @ingredients = Ingredient.all
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @categories = Category.all
    render :show
  end

  def update
    @recipe = Recipe.new(recipe_params)
    @categories = Category.all
    @ingredients = Ingredient.all
    if @recipe.update(recipe_params)
      if params[:category_selection].to_i != 0
        category = Category.find(params[:category_selection].to_i)
        category.recipes << @recipe
      end
      if params[:ingredient_selection].to_i != 0
        ingredient = Ingredient.find(params[:ingredient_selection].to_i)
        ingredient.recipes << @recipe
      end
      flash[:notice] = "Recipe has been successfully updated"
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id]).destroy
    flash[:notice] = "Recipe has been successfully deleted"
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :instructions)
    end

end