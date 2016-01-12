class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user

  private

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      redirect_to login_path
      false
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :full_name)
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:format] || params[:id])
    unless @user
      flash[:notice] = 'Unable to find your account.'
      redirect_to login_path
    end
  end
end
