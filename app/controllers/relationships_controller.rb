class RelationshipsController < ApplicationController
  def create
    current_user.follow!(params[:user_id])
    redirect_to user_path(params[:user_id]), notice: t('.followed')
  end

  def destroy
    current_user.unfollow!(current_user.active_relationships.find_by!(followed_id: params[:user_id]).followed_id)
    redirect_to user_path(params[:user_id]), notice: t('.unfollowed'), status: :see_other
  end
end
