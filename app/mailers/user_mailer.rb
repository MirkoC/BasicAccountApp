class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail( :to => @user.email,
          :subject => 'Welcome',
          :content_type => 'text/html')
  end

  def verification_instructions(user)
    @user = user
    @verification_url = verify_url(@user.perishable_token)
    mail( :to => @user.email,
          :subject => 'Email Verification',
          :content_type => 'text/html')
  end

  def password_reset_instructions(user)
    @user = user
    @edit_password_reset_url = edit_password_reset_url(@user.perishable_token)
    mail( :to => @user.email,
          :subject => 'Password Reset Instructions',
          :content_type => 'text/html')
  end
end
