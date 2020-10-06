class SearchController < ApplicationController

  def search
    @word = params[:search_content]
    if params[:search_content]
      if params[:search_model] == "1"
        if params[:search_how] == "1"
          @contents = User.where("name LIKE ?", "#{params[:search_content]}")
          render :search_users
        elsif params[:search_how] == "2"
          @contents = User.where("name LIKE ?", "#{params[:search_content]}%")
          render :search_users
        elsif params[:search_how] == "3"
          @contents = User.where("name LIKE ?", "%#{params[:search_content]}")
          render :search_users
        else
          @contents = User.where("name LIKE ?", "%#{params[:search_content]}%")
          render :search_users
        end
      else
        if params[:search_how] == "1"
          @contents = Book.where("title LIKE ?", "#{params[:search_content]}")
          render :search_books
        elsif params[:search_how] == "2"
          @contents = Book.where("title LIKE ?", "#{params[:search_content]}%")
          render :search_books
        elsif params[:search_how] == "3"
          @contents = Book.where("title LIKE ?", "%#{params[:search_content]}")
          render :search_books
        else
          @contents = Book.where("title LIKE ?", "%#{params[:search_content]}%")
          render :search_books
        end
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
