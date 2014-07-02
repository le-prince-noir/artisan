class Cart < ActiveRecord::Base

    has_and_belongs_to_many :products
    has_and_belongs_to_many :carts_products
    # has_many :products
    # has_many :carts_products
end
