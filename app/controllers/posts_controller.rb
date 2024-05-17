class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end
end
