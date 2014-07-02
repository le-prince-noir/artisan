class Product < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
	validates :marge, presence: true

    # attr_accessor :image

    has_and_belongs_to_many :ingredients

    has_many :carts_products
    has_many :carts, :through => :carts_products

    # has_one :cart
    # has_one :carts_products, :through => :cart

    accepts_nested_attributes_for :ingredients


# has_attached_file :image, :styles => { :small => "150x150>" },
#                   :url  => "/assets/images/products/:id/:style/:basename.:extension",
#                   :path => ":rails_root/public/assets/images/products/:id/:style/:basename.:extension"

# validates_attachment_presence :image
# validates_attachment_size :image, :less_than => 5.megabytes
# validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  # def image_from_url(url)
  #   self.image = open(url)
  # end
    after_save :add_history

    before_save :slug_product


    def slug_product
        if self[:slug].empty?
            self.slug = self.title.parameterize
        else
            self.slug = self.slug.parameterize
        end
    end

    def add_history
        if self.marge_changed?
            h = HistoricsProduct.new
            h.id_product = self.id
            h.marge = self.marge
            h.save
        end
    end

    def total
        total = 0
        self.ingredients.each do |ingredient|
          total += ingredient.price
        end
        total += self.marge
        return total
    end

end
