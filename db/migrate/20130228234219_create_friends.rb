class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.integer :user_id
      t.boolean :hasapp
      t.integer :friend_id

      t.timestamps
    end
  end
end
