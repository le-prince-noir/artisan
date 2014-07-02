class Carts < ActiveRecord::Migration
  	def change
	    create_table :carts do |t|
          t.integer :actif
	      t.timestamps
	      t.timestamps
  		end
	end
end
