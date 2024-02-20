class Recipe < ApplicationRecord
    validates :ingredients, presence: true
    validates :recipe_text, presence: true
  end  