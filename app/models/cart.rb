class Cart < ActiveRecord::Base
	belongs_to :orders
	has_many :products_cart
end