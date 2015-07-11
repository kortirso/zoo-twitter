class TwitterController < ApplicationController
	before_action :get_users

	def index
		if current_user
			@tweets = Tweet.where('user_id = ?', current_user).order(id: :desc)
			@tweet = Tweet.new
			render template: 'twitter/index'
		else
			render template: 'twitter/welcome'
		end
	end

	def account
		if current_user
			user = User.where('username = ?', params[:username]).first
			if user
				@tweets = Tweet.where(user_id: user).order(id: :desc)
				render template: 'twitter/account'
			else
				render template: "layouts/403", status: 404
			end
		else
			render template: 'twitter/welcome'
		end
	end

	private
		def get_users
			@users = User.order(tweets_counter: :desc).limit(10)
		end
end
