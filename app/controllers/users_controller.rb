class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
    @books = Book.all
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
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

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
   end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
