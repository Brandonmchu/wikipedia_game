class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :hasapp, :name, :user_id
  belongs_to :users
  self.per_page = 10

end
