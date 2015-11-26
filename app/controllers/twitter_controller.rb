class TwitterController < ApplicationController
    before_action :get_access, except: :locale
    before_action :get_users
    after_action :get_url, except: :locale

    def index
        @user = User.find(current_user.id)
        @tweets = Tweet.from_users_followed_by(@user).order(id: :desc)
        @tweet = Tweet.new
        render template: 'twitter/index'
    end

    def account
        @user = User.where('username = ?', params[:username]).first
        if @user
            @tweets = Tweet.where(user_id: @user).order(id: :desc)
            render template: 'twitter/account'
        else
            render template: "layouts/403", status: 404
        end
    end

    def following
        @user = params[:username] ? User.where('username = ?', params[:username]).first : User.find(current_user.id)
        if @user
            @following = @user.followed_users
            render template: 'twitter/following'
        else
            render template: "layouts/403", status: 404
        end
    end

    def followers
        @user = params[:username] ? User.where('username = ?', params[:username]).first : User.find(current_user.id)
        if @user
            @followers = @user.followers
            render template: 'twitter/followers'
        else
            render template: "layouts/403", status: 404
        end
    end

    def settings

    end

    def locale
        params[:name] == 'ru' ? session[:locale] = 'ru' : session[:locale] = 'en'
        redirect_to session[:url]
    end

    private
    def get_url
        session[:url] = request.original_url
    end

    def get_access
        render template: 'twitter/welcome' unless current_user
    end

    def get_users
        @users = User.order(tweets_counter: :desc).limit(10)
    end
end
