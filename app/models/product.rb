class Product < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
	validates :marge, presence: true

	has_and_belongs_to_many :ingredients
    accepts_nested_attributes_for :ingredients
end
