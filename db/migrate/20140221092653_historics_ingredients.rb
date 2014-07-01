class HistoricsIngredients < ActiveRecord::Migration
  	def change
	    create_table :historics_ingredients do |t|
          t.integer :id_ingredient
	      t.float :price
	      t.timestamps
  		end
	end
end
