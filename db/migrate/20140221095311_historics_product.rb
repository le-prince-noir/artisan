class HistoricsProduct < ActiveRecord::Migration
  	def change
	    create_table :historics_products do |t|
          t.string :title
	      t.float :marge
	      t.timestamps
  		end
	end
end
