class Product < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
	validates :marge, presence: true

	has_and_belongs_to_many :ingredients
    accepts_nested_attributes_for :ingredients


    after_save :addHistory

    def addHistory
        if self.marge_changed?
            h = HistoricsProducts.new
            h.id_product = self.id
            h.marge = self.marge
            h.save
        end
    end

end
