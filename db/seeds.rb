# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Database for user
User.create(name: "stal", email: "stal@hotmail.com", password: "stal", role: 1)

user = {}
user['password'] = 'stal'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Recipes
recipe = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    recipe['title'] = Faker::Food.dish
    recipe['category'] = ["Dessert", "Appetizer", "Breakfast", "Main Course", "Bread", "Other"].sample
    recipe['description'] = Faker::Hipster.paragraphs(1)
    recipe['duration'] = ["30 Minutes","1 Hours","1 Hours 15 Minutes", "1 Hours 30 Minutes", "1 Hours 45 Minutes", "2 Hours", "2 Hours 15 Minutes", "2 Hours 30 Minutes"].sample
    recipe['user_id'] = uids.sample

    Recipe.create(recipe)
  end
end

# Seed Ingredients
ingredient = {}
Recipe.all.each {|u| uids << u.id }
ActiveRecord::Base.transaction do
  80.times do 
    ingredient['name'] = Faker::Food.ingredient
    ingredient['amount'] = rand(1..10)
    ingredient['recipe_id'] = uids.sample

    Ingredient.create(ingredient)
  end
end

# Seed Follows
follow = {}
User.all.each {|u| uids << u.id }
ActiveRecord::Base.transaction do
  40.times do 
    follow['follower'] = rand(2..20)
    follow['user_id'] = uids.sample

    Follow.create(follow)
  end
end