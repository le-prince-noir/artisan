class Product < ActiveRecord::Base

	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
	validates :marge, presence: true, numericality: true

    has_and_belongs_to_many :ingredients

    has_many :carts_products
    has_many :carts, :through => :carts_products


    # accepts_nested_attributes_for :ingredients


    after_save :add_history

    before_save :slug_product

    before_destroy :cleanup


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

    def save_image(upload, name)
        # puts YAML::dump( upload )
        ext = upload.original_filename.split('.').last.to_s
        timestamp = Time.now.to_i.to_s
        name =  name.parameterize
        name = name+'_'+timestamp+'.'+ext

        directory = "public/images/products"
        # create the file path
        path = File.join(directory, name)
        # write the file
        File.open(path, "wb") { |f| f.write(upload.read) }

        return name
    end

    def cleanup
        if File.exist?("public/images/products/#{self.image}")
            File.delete("public/images/products/#{self.image}")
        end
    end
end
