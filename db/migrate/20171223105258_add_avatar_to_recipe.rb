class AddAvatarToRecipe < ActiveRecord::Migration[5.1]
  def change
  	add_column :recipes, :avatar, :json
  end
end
