class Recipe < ApplicationRecord
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :instructions, dependent: :destroy
	has_many :likes, dependent: :destroy
	accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :instructions, :reject_if => :all_blank, :allow_destroy => true
	
	mount_uploaders :avatar, AvatarUploader
	serialize :avatars, JSON
	
	scope :category, -> (category) { where category: category}
	scope :user_id, -> (user_id) { where user_id: user_id}
end
