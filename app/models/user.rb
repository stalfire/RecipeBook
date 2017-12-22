require 'bcrypt'
class User < ApplicationRecord
	has_many :recipe

	validates :email, presence: true
  	validates :email, uniqueness: true
  	validates :name, presence: true
	has_secure_password
end
