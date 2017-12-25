class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.string :follower
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
