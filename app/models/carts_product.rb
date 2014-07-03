class CartsProduct < ActiveRecord::Base
    belongs_to :cart
    belongs_to :product

    before_save :save_price


    def remove_one
        # puts YAML::dump( self )
        self.quantity = self.quantity - 1
        self.save
        if(self.quantity <= 0)
            self.destroy
        end
    end

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
