class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :ingredient_count
      t.string :ingredients
      t.string :difficulty
      t.string :instructions
      t.integer :user_id

      t.timestamps
    end
  end
end
