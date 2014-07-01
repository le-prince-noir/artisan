class HistoricsProducts < ActiveRecord::Migration
  	def change
	    create_table :historicsproducts do |t|
	      t.float :marge
	      t.timestamps 
  		end
	end
end