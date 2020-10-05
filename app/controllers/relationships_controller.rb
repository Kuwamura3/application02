class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = "success"
      redirect_to @user
      # ↑リダイレクト先が不明
    else
      flash.now[:alert] = "faild"
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = "success"
      redirect_to @user
      # ↑リダイレクト先が不明
    else
      flash.now[:alert] = "faild"
      redirect_to @user
    end
  end

  private
  def @user = User.find(params[:relationship][:follow_id)
  end

end
