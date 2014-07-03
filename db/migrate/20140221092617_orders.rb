class Orders < ActiveRecord::Migration
  	def change
	    create_table :orders do |t|
          t.string :title
	      t.string :global_price
          t.timestamps
  		end
	end
end
