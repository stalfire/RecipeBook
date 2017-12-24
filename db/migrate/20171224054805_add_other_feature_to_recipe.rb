class AddOtherFeatureToRecipe < ActiveRecord::Migration[5.1]
  def change
  	add_column :recipes, :duration, :string
  end
end
