class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
		t.string :name
      	t.references :recipe, foreign_key: true

      	t.timestamps null: false
    end
  end
end
