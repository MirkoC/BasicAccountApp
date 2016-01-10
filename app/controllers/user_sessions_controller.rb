class UserSessionsController < ApplicationController
  before_filter :require_user, only: :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:notice] = 'Login successful, welcome!'
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = 'Logout successful!'
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:username, :password, :remember_me)
  end
end
