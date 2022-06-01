class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books.page(params[:page])
  end

  def edit
  end

  def index
     @books = Book.all
     @book = Book.new
     @user = current_user
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to book_path(@book.id)
  end
end
