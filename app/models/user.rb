require 'bcrypt'
class User < ApplicationRecord
	has_many :recipes, dependent: :destroy

	validates :email, presence: true
  	validates :email, uniqueness: true
  	validates :name, presence: true
	has_secure_password
end
