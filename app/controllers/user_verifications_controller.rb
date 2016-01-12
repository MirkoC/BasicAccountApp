class UserVerificationsController < ApplicationController
  before_filter :load_user_using_perishable_token

  def update
    @user.verify!
    flash[:notice] = 'Thank you for verifying your account. You may now login.'
    redirect_to login_path
  end
end
