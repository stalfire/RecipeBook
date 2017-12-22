class Recipe < ApplicationRecord
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :instructions, dependent: :destroy
	accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :instructions, :reject_if => :all_blank, :allow_destroy => true

	scope :category, -> (category) { where category: category}
end
