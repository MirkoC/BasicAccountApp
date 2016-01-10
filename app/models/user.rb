class User < ActiveRecord::Base
  acts_as_authentic

  def self.find_by_username_or_email(login)
    User.find_by_username(login) || User.find_by_email(login)
  end

  def deliver_welcome_email!
    reset_perishable_token!
    SendWelcomeEmailJob.perform_later(self.id)
  end
end
