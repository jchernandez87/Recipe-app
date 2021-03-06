class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).includes(:user).order(created_at: :desc)
  end

  def show
    @public_recipes = Recipe.find(params[:id])
  end
end
