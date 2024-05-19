class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_post, only: %i[edit update]

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_url, notice: t('controller.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_url, notice: t('controller.updated'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
