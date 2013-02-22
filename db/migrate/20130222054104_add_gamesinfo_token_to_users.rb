class AddGamesinfoTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :games_played, :int
    add_column :users, :games_won, :int
    add_column :users, :games_lost, :int
    add_column :users, :token, :string
  end
end
