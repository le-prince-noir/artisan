class CartsProduct < ActiveRecord::Base
    belongs_to :cart
    belongs_to :product

    before_save :save_price


    def save_price
        # puts YAML::dump( self )
        if self.quantity.nil?
            self.quantity = 1
        end
        p = self.product
        total = 0

        p.ingredients.each do |ingredient|
          total += ingredient.price
        end

        total += p.marge

        self.price = total
    end


end
