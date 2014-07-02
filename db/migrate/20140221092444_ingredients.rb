class Ingredients < ActiveRecord::Migration
  	def change
	    create_table :ingredients do |t|
	      t.string :title
	      t.string :slug
	      t.text :description
	      t.text :image
	      t.float :price
	      t.timestamps
  		end
	end
end
