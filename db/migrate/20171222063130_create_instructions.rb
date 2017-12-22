class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
		t.string :step
      	t.references :recipe, foreign_key: true

      	t.timestamps null: false
    end
  end
end
