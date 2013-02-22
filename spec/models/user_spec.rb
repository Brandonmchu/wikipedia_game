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

require 'spec_helper'

describe User do
	before {@user = User.new(provider:"facebook",name: "Example",uid: "0000",games_played: "0", games_lost:"0", 
		games_won:"0", token:"AAABBBCCC")}
	subject {@user}

	it {should respond_to(:provider)}
	it {should respond_to(:name)}
	it {should respond_to(:uid)}
	it {should respond_to(:games_played)}
	it {should respond_to(:games_won)}
	it {should respond_to(:games_lost)}
	it {should respond_to(:token)}
  	
end

