class CreateFoodRecipies < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipies do |t|

      t.timestamps
    end
  end
end
