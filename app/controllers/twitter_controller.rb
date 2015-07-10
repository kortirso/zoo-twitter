class TwitterController < ApplicationController

	def index
		if current_user
			@tweets = Tweet.where('user_id = ?', current_user).order(created_at: :desc)
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
				@tweets = Tweet.where(user_id: user).order(created_at: :desc)
				render template: 'twitter/account'
			else
				render template: "layouts/403", status: 404
			end
		else
			render template: 'twitter/welcome'
		end
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = current_user.id
		respond_to do |format|
			if @tweet.save
				format.html { redirect_to tweets_path }
			else
				format.html { redirect_to tweets_path }
			end
		end
	end

	private
		def tweet_params
			params.require(:tweet).permit(:text, :user_id)
		end

end
