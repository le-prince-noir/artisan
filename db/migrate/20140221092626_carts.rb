class Carts < ActiveRecord::Migration
  	def change
	    create_table :carts do |t|
          t.integer :actif
          t.integer :order_id
	      t.timestamps
	      t.timestamps
  		end
	end
end
