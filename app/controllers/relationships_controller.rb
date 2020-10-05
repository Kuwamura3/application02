class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = "success"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "failed"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = "success"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "failed"
      redirect_to user_path(@user)
    end
  end

end
