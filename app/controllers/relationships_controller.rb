class RelationshipsController < ApplicationController

  def create
    path = Rails.application.routes.recognize_path(request.referer)
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      if path[:action] == "show"
        redirect_to user_path(@user)
      else
        redirect_to users_path
      end
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    path = Rails.application.routes.recognize_path(request.referer)
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      if path[:action] == "show"
        redirect_to user_path(@user)
      else
        redirect_to users_path
      end
    else
      redirect_to user_path(@user)
    end
  end

end
