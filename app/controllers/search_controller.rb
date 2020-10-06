class SearchController < ApplicationController

  def search
    if params[:search_content]
      @contents = User.where("name LIKE ?", "%#{params[:search_content]}%")
      render :search_users
    else
      @contents = User.none
      redirect_to search_users_path
    end
  end

  def search_users
  end

  def search_books
  end

end
