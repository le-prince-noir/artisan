class HistoricsIngredient < ActiveRecord::Migration
  	def change
	    create_table :historics_ingredients do |t|
          t.string :title
	      t.float :price
	      t.timestamps
  		end
	end
end
