class Users::RelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow!(@user)
    redirect_to user_path(@user), notice: t('.followed')
  end

  def destroy
    current_user.unfollow!(@user)
    redirect_to user_path(@user), notice: t('.unfollowed'), status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
