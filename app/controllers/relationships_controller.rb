class RelationshipsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_users

    def create
        @user = User.find(params[:relationship][:followed_id])
        current_user.follow!(@user)
        current_user.update_attribute('followed_counter', current_user.followed_counter + 1)
        @user.update_attribute('followers_counter', @user.followers_counter + 1)
        @user = current_user
        respond_to do |format|
            format.js
        end
    end

    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow!(@user)
        current_user.update_attribute('followed_counter', current_user.followed_counter - 1)
        @user.update_attribute('followers_counter', @user.followers_counter - 1)
        @user = current_user
        respond_to do |format|
            format.js
        end
    end

    private
    def get_users
        @users = User.order(tweets_counter: :desc).limit(10)
    end
end
