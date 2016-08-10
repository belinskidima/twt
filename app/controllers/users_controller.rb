class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: :show
  before_action :set_user, only: [:show, :followers, :following, :follow, :unfollow]
  respond_to :html, :js

  def index
    @user = current_user
    respond_with @users = User.includes(:tweets).where.not(id: current_user.id)
  end

  def show
    respond_with @user
  end

  def followers
    respond_with @followers = @user.followers
  end

  def following
    respond_with @following = @user.following
  end

  def follow
    respond_with current_user.follow(@user)
  end

  def unfollow
    respond_with current_user.unfollow(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_tweet
    @tweet = current_user.tweets.build
  end
end
