class Orders < ActiveRecord::Migration
  	def change
	    create_table :orders do |t|
          t.integer :client_id
	      t.string :global_price
          t.timestamps
  		end
	end
end
