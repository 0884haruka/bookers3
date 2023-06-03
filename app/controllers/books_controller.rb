class BooksController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = @Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to  book_path(@book.id)
      else
        render :edit
      end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save!
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @book = Book.all
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
