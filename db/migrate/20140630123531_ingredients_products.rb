class IngredientsProducts < ActiveRecord::Migration
  def change
    create_table :ingredients_products do |t|
      t.integer :product_id
      t.integer :ingredient_id
    end
  end
end