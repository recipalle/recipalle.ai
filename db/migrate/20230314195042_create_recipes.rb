class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.text :ingredients
      t.text :recipe_text

      t.timestamps
    end
  end
end
