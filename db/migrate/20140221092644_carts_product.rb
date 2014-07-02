class CartsProduct < ActiveRecord::Migration
  	def change
	    create_table :carts_products do |t|
          t.integer :cart_id
          t.integer :product_id
	      t.float :quantity
	      t.float :price
	      t.timestamps
  		end
	end
end
