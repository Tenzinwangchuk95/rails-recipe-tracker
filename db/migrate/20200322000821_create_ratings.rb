class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.string :description
      t.integer :recipe_id
      t.integer :user_id

      t.timestamps
    end
  end
end
