class TwitterController < ApplicationController

	def index
		if current_user
			@tweets = Tweet.where('user_id = ?', current_user).order(created_at: :desc)
			render template: 'twitter/index'
		else
			render template: 'twitter/welcome'
		end
	end

	def account
		if current_user
			user = User.where('username = ?', params[:username]).first
			if user
				@tweets = Tweet.where(user_id: user).order(created_at: :desc)
				render template: 'twitter/account'
			else
				render template: "layouts/403", status: 404
			end
		else
			render template: 'twitter/welcome'
		end
	end

end
