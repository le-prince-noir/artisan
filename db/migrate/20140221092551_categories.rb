class Categories < ActiveRecord::Migration
  	def change
	    create_table :categories do |t|
	      t.string :title
	      t.string :slug
	      t.text :description
	      t.timestamps 
	      t.timestamps 
  		end
	end
end