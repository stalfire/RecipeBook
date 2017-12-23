class AddAmountToIngredient < ActiveRecord::Migration[5.1]
  def change
  	add_column :ingredients, :amount, :string
  end
end
