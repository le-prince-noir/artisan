class Ingredient < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
    validates :price, presence: true

	has_and_belongs_to_many :products

    after_save :add_history

    before_save :slug_ingredient

    has_many :historics_ingredients


    def slug_ingredient
        if self[:slug].empty?
            self.slug = self.title.parameterize
        else
            self.slug = self.slug.parameterize
        end
    end


    def add_history
        if self.price_changed?
            h = HistoricsIngredient.new
            h.ingredient_id = self.id
            h.price = self.price

            h.save
        end
    end
end
