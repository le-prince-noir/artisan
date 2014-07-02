class Order < ActiveRecord::Base

	has_one :cart
    belongs_to :client


    before_save :order_price

    after_save :cart_desactive


    def order_price
        self.global_price = self.cart.total
    end

    def cart_desactive
        self.cart.actif = 0
        self.cart.save
    end

end
