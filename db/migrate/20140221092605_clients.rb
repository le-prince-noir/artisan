class Clients < ActiveRecord::Migration
  	def change
	    create_table :clients do |t|
	      t.string :lastname
	      t.string :firstname
	      t.string :email
	      t.string :tel
	      t.text :address
	      t.timestamps
  		end
	end
end
