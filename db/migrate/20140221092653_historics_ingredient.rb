class HistoricsIngredient < ActiveRecord::Migration
  	def change
	    create_table :historics_ingredients do |t|
          t.integer :ingredient_id
	      t.float :price
	      t.timestamps
  		end
	end
end
