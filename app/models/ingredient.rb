class Ingredient < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
	validates :price, presence: true
	
	has_and_belongs_to_many :products
end