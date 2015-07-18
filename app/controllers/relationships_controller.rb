class RelationshipsController < ApplicationController
	before_action :get_users

	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		respond_to do |format|
			format.js
		end
	end

	private
		def get_users
			@users = User.order(tweets_counter: :desc).limit(10)
		end
end
