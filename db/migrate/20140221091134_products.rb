class Products < ActiveRecord::Migration
  	def change
	    create_table :products do |t|
	      t.string :title
	      t.string :slug
	      t.text :description
	      t.text :image
	      t.float :marge
	      t.timestamps
  		end
	end
end
