require 'bcrypt'
class User < ApplicationRecord
	has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
	validates :email, presence: true
  	validates :email, uniqueness: true
  	validates :name, presence: true
	has_secure_password

  mount_uploaders :avatar, AvatarUploader
  serialize :avatars, JSON

	enum role: [ :reg_user, :admin ] 

	has_many :authentications, dependent: :destroy

    def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      name: auth_hash["extra"]["raw_info"]["name"],
      email: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.hex(5) 
      # rand(36**9).to_s(36)
    )
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end
end
