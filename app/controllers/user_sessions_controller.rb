class UserSessionsController < ApplicationController
  before_filter :require_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user_session = UserSession.new(user_params)
    if @user_session.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end
end
