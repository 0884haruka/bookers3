class UsersController < ApplicationController
  

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def edit
     @user = User.find(params[:id])
  end
  
  def list_params
    params.require(:user).permit(:title, :body, :image)
  end
end
