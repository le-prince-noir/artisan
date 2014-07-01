class ProductsCart < ActiveRecord::Migration
  	def change
	    create_table :productscart do |t|
	      t.string :title
	      t.float :quantity
	      t.float :price
	      t.timestamps 
  		end
	end
end