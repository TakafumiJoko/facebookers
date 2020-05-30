class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book_user, only: [:edit]
  
  def correct_book_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
  
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @new_book = Book.new
    @books = Book.all
  end
  
  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end
    
  def create
    @user = User.find(current_user.id)
    @users = User.all
    @new_book = Book.new(book_params)
    @new_book.user_id = @user.id
    if @new_book.save
      flash[:success] ="You have creatad book successfully."
      redirect_to edit_book_path(@user.id)
    else
      render template: "users/index"
    end
  end

  def edit
    @user = User.find(current_user.id)
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private 
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
