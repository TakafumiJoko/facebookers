class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
  end
  
  def show
    @book = Book.new
  end
    
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] ="You have creatad book successfully."
      redirect_to @book
    else
      render "index"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private 
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
