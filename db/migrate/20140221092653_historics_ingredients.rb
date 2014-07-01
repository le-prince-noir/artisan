class HistoricsIngredients < ActiveRecord::Migration
  	def change
	    create_table :historicsingredients do |t|
	      t.float :price
	      t.timestamps
  		end
	end
end