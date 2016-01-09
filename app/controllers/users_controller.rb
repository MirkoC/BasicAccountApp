class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have successfully created account.'
      redirect_to root_path
    else
      render :new
    end
  end
end
