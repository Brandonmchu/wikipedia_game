class GamePagesController < ApplicationController
	
	def sendrequest
		redirect_to root_url
	end

	def home
		if signed_in?
			@friends = current_user.friends.page(params[:page]).order(:name)
		else
			@friends = nil
		end
	end

end
  