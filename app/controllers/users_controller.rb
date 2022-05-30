class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books.page(params[:page])
  end

  def edit
  end

  def index
   
  end
end
