class Product < ActiveRecord::Base

	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
	validates :marge, presence: true

    has_and_belongs_to_many :ingredients

    has_many :carts_products
    has_many :carts, :through => :carts_products


    # accepts_nested_attributes_for :ingredients


    after_save :add_history

    before_save :slug_product


    def slug_product
        self.slug = self[:slug].empty? ? self.title.parameterize : self.slug.parameterize
    end

    def add_history
        if self.marge_changed?
            h = HistoricsProduct.new
            h.title = self.title
            h.marge = self.marge
            h.save
        end
    end

    def total
        return self.ingredients.map(&:price).sum + self.marge
    end


    def save_image(upload)
        name =  upload.original_filename
        directory = "public/images/products"
        # create the file path
        path = File.join(directory, name)
        # write the file
        File.open(path, "wb") { |f| f.write(upload.read) }
    end

end
