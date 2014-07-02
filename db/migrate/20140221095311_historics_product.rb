class HistoricsProduct < ActiveRecord::Migration
  	def change
	    create_table :historics_products do |t|
          t.integer :id_product
	      t.float :marge
	      t.timestamps
  		end
	end
end
