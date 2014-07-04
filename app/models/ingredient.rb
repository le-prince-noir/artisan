class Ingredient < ActiveRecord::Base
	validates :title, length: {minimum:2}
	validates :description, length: {minimum:3}
    validates :price, presence: true

	has_and_belongs_to_many :products

    after_save :add_history

    before_save :slug_ingredient

    before_destroy :cleanup

    def slug_ingredient
        self.slug  = self[:slug].empty? ? self.title.parameterize : self.slug.parameterize
    end


    def add_history
        if self.price_changed?
            h = HistoricsIngredient.new
            h.title = self.title
            h.price = self.price

            h.save
        end
    end

    def save_image(upload, name)
        # puts YAML::dump( upload )
        ext = upload.original_filename.split('.').last.to_s
        timestamp = Time.now.to_i.to_s
        name =  name.parameterize
        name = name+'_'+timestamp+'.'+ext

        directory = "public/images/ingredients"
        # create the file path
        path = File.join(directory, name)
        # write the file
        File.open(path, "wb") { |f| f.write(upload.read) }

        return name
    end

  def cleanup
        if File.exist?("public/images/ingredients/#{self.image}")
            File.delete("public/images/ingredients/#{self.image}")
        end
  end
end
