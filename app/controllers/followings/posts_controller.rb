class Followings::PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.following_ids).order(created_at: :desc).page(params[:page]).per(10)
  end
end
