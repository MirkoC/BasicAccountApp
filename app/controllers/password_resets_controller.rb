class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, only: [ :edit, :update ]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = 'Instructions to reset your password had been emailed to you.'
      redirect_to login_path
    else
      flash.now[:error] = email_username_error_message
      render :new
    end
  end

  def edit
  end

  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      flash[:notice] = 'Your password was successfully updated!'
      redirect_to login_path
    else
      flash[:error] = reset_password_error_message
      redirect_to edit_password_reset_url(@user.perishable_token)
    end
  end

  private

  def reset_password_error_message
    message ||= ''
    @user.errors.full_messages.each do |msg|
      message += "#{msg} "
    end
    message
  end

  def email_username_error_message
    if is_email(params[:email])
      "No user was found with email address #{params[:email]} !"
    else
      "No user was found with username #{params[:email]} !"
    end
  end

  def is_email(str)
    return str.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)
  end
end
