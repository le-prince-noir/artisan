class Cart < ActiveRecord::Base

    has_many :products, :through => :carts_products
    has_many :carts_products
end
