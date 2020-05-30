class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]
  
  # def correct_user
  #   unless current_user.id == params[:id]
  #     redirect_to user_path(params[:id])
  #   end
  # end
  
  def correct_user
    user = User.find(params[:id])
    unless current_user == user
      redirect_to user_path(current_user)
    end
  end

  
  def index
    @new_book = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = Book.where(user_id: @user.id)
  end
  
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] ="You have updated user successfully."
      redirect_to @user
    else
      render "edit"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
