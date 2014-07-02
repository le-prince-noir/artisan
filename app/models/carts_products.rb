class CartsProducts < ActiveRecord::Base
    # belongs_to :cart
    # belongs_to :cart
    # has_one :cart
    has_and_belongs_to_many :carts
    has_and_belongs_to_many :products
    # has_many :products
    before_save :savePrice


    def savePrice
        # raise 1
        # self.product_id = params[:id]
        # self.cart_id = c.id
        self.quantity = 1
        p = Product.find(params[:id])
        total = 0

        p.ingredients.each do |ingredient|
          total += ingredient.price
        end

        total += p.marge

        self.price = total

        self.save


    end


end
