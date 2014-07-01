class Ingredient < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
	validates :price, presence: true

	has_and_belongs_to_many :products

    after_save :addHistory

    def addHistory
        if self.price_changed?
            h = HistoricsIngredients.new
            h.id_ingredient = self.id
            h.price = self.price

            h.save
        end
    end
end
