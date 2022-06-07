class BooksController < ApplicationController
    before_action :correct_user, only: [:edit, :update]
  def new
  end

  def show
    @books = Book.all
    @new_book = Book.new
    @user = current_user
    @book = Book.find(params[:id])
  end

  def index
     @books = Book.all
     @book = Book.new
     @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @user = current_user
     @books = Book.all
     if @book.save
     flash[:success] = "You have created book successfully."
     redirect_to book_path(@book.id)
     else
        render :index
     end
  end

   def update
    @book = Book.find(params[:id])
    @user = current_user
    if @book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
        render :edit
    end
   end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
     params.require(:book).permit(:title, :body)
  end
end
