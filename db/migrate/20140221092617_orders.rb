class Orders < ActiveRecord::Migration
  	def change
	    create_table :orders do |t|
	      t.string :date
	      t.string :global_price
  		end
	end
end