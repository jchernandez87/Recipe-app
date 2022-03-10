class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def show
    @inventory = Inventory.where(user_id: current_user.id)
    @recipe = Recipe.find(params[:recipe_id])
    @food_recipes = FoodRecipe.where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:recipe][:name]
    @recipe.preparation_time = params[:recipe][:preparation_time]
    @recipe.cooking_time = params[:recipe][:cooking_time]
    @recipe.description = params[:recipe][:description]
    @recipe.user_id = params[:user_id]
    if @recipe.save
      flash[:success] = 'Recipe saved!!'
      redirect_to recipes_index_path
    else
      flash[:error] = 'Recipe save failed'
    end
  end

  def update
    recipe = Recipe.find(params[:recipe_id])
    case recipe.public
    when false
      recipe.public = true
      recipe.save
      redirect_to recipes_show_path(recipe.id)
    when true
      recipe.public = false
      recipe.save
      redirect_to recipes_show_path(recipe.id)
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    recipe.destroy
    if recipe.destroy
      flash[:success] = 'Recipe deleted'
      redirect_to recipes_index_path
    else
      flash[:error] = 'Recipe delete failed'
    end
  end
end
