class SearchController < ApplicationController

  def search
    if params[:search_content]
      if params[:search_model] == "1"
        @contents = User.where("name LIKE ?", "%#{params[:search_content]}%")
        render :search_users
      else
        @contents = Book.where("title LIKE ?", "%#{params[:search_content]}%")
        render :search_books
      end
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
