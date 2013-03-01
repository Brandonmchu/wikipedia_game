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
  has_many :friends, dependent: :destroy
  validates :uid, presence:true, uniqueness:true
  self.primary_key = 'uid'


  def self.create_with_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		user.name = auth["info"]["name"]
  		user.token = auth["credentials"]["token"]
      user.games_played = 0
      user.games_won = 0
      user.games_lost = 0
      user.createfriendslist
    end
  end

  def facebook
  	@facebook ||= Koala::Facebook::API.new(token)
  	block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
  	logger.info e.to_s
  	nil
  end

  def friendconnection
  	facebook {|fb| fb.get_connections("me","friends")}
  end

  def createfriendslist
    self.friendconnection.each do |addfriend|
      if(Friend.find_by_friend_id_and_user_id(addfriend['id'],self.uid).nil?)
        @temp = Friend.new(user_id:self.uid, friend_id: addfriend['id'],name:addfriend['name'])
        @temp.save
      else
        @temp = Friend.find_by_user_id_and_friend_id(self.uid,addfriend['id'])
        @temp.update_attributes(name:addfriend['name'])
      end
    end
  end

end
