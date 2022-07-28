class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
    p "================================"
    p @recipes
    p "================================"

  end

  def show
    @recipe = Recipe.find(params[:id])
    p @recipe
  end

  def destroy
    p "=================================="
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: 'Deleted Recipe: #{recipe.name}'
    p show_errors(recipe)
  end

  def create 
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Recipe Created!"
    else
      p  show_errors(@recipe)
    end
  end


  def new
    @recipe = current_user.recipes.build
  end

  private
    def recipe_params 
      params.require(:recipe).permit(:name, :description)
    end

    def show_errors(recipe)
      recipe.errors.full_messages
    end
end