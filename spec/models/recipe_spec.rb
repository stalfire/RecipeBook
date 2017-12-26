require 'rails_helper'

RSpec.describe Recipe, type: :model do
	before(:each) do
        User.create(id: 3, name: 'rspec_user3', email: 'rspec_user3@hotmail.com', password: 'rspec_user3')
    end
  	describe "create" do
  		context "a new recipe" do
  			it "to save with user id to test association" do
  				recipe = Recipe.create(user_id: 3, title: 'Roast Chicken', description: 'Roast it to crispy', duration: '2 Hour', category: 'Main Course')
  				expect(recipe).to be_valid
  			end

  			it "not be save with empty title" do
  				recipe = Recipe.create(user_id: 3, description: "Fine roasted chicken")
  				expect(recipe).to_not be_valid 
  			end
  		end
  	end
end
