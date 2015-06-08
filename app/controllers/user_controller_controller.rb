class UserControllerController < ApplicationController

	before_filter :authenticate_user!

  def user
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


end
