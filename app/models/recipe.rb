class Recipe < ApplicationRecord
	belongs_to :user
	has_many :ingredients
	has_many :instructions
	accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :instructions, :reject_if => :all_blank, :allow_destroy => true
end
