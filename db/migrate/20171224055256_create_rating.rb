class CreateRating < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
    	t.integer :like
		t.references :user, foreign_key: true
		t.references :recipe, foreign_key: true
    end
  end
end
