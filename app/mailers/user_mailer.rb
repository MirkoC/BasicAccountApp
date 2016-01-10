class UserMailer < ApplicationMailer
  def welcome(user)

    @user = user
    mail( :to => @user.email,
          :subject => 'Welcome',
          :content_type => 'text/html')
  end
end
