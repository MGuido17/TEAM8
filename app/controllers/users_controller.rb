class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activities = @user.activities
  end

  def index
    @users = User.all
  end

  def new
  end

  def create
  end


end
