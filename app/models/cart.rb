class Cart < ActiveRecord::Base

    has_many :products, :through => :carts_products
    has_many :carts_products

    belongs_to :order

    def total
        total = 0
        self.carts_products.each do |cart_product|
            total += cart_product.price * cart_product.quantity
        end
        return total
    end
end
