require "#{Rails.root}/app/controllers/openai_service"
require "#{Rails.root}/app/models/recipe"

# app/controllers/recipes_controller.rb
class RecipesController < ApplicationController

  def index
    # Add any logic you need for displaying recipes or other content on the index page
  end
    
  def generate
    if current_user.free_trials_used >= 3 && !current_user.subscribed?
      redirect_to new_subscription_path
    else
      ingredients = params[:ingredients]
      if ingredients.blank?
        flash[:alert] = "Please enter some ingredients."
      else
        recipe_text = OpenaiService.generate_recipe(ingredients)
        
        # Increment the free_trials_used counter for non-subscribed users
        if !current_user.subscribed?
          current_user.increment!(:free_trials_used)
        end
  
        @recipe = Recipe.new(
          ingredients: ingredients.split(",").map(&:strip),
          recipe_text: recipe_text
        )
        if @recipe.save
          redirect_to @recipe
        else
          render 'new'
        end
      end
    end
  end  

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
  end  
end  
