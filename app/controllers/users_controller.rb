class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
  end

  def show
    @book = Book.new
  end

  def update
  end
end
