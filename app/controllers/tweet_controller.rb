class TweetController < ApplicationController
	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = current_user.id
		respond_to do |format|
			if @tweet.save
				user = User.find(current_user)
				user.update_attribute('tweets_counter', user.tweets_counter + 1)
				format.js
			else
				format.js
			end
		end
	end

	private
		def tweet_params
			params.require(:tweet).permit(:text, :user_id)
		end
end
