class Client < ActiveRecord::Base
	validates :lastname, length: {minimum:2}
	validates :firstname, length: {minimum:2}
	validates :address, presence: true
	validates :email, presence: true
	validates :tel, presence: true

	has_many :orders
end
