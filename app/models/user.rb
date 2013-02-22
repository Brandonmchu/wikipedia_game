# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  provider     :string(255)
#  uid          :string(255)
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  games_played :integer
#  games_won    :integer
#  games_lost   :integer
#  token        :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid


  def self.create_with_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		user.name = auth["info"]["name"]
  		user.token = auth["credentials"]["token"]
  	end
  end
end
