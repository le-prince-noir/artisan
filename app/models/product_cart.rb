class ProductCart < ActiveRecord::Base
	validates :title, presence: true
	validates :price, presence: true
	validates :quantity, presence: true
end