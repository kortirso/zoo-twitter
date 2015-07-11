class TweetController < ApplicationController
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
