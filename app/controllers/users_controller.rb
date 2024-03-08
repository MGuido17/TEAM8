class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @activities = @user.activities
  end



  def new
  end

  def create
  end


end
