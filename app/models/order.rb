class Order < ActiveRecord::Base
	validates :date, presence: true
	validates :global_price, presence: true
	
	has_one :carts
end