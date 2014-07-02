class Categorie < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}

    has_many :products
    has_many :carts
end
