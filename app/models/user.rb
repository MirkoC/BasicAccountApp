class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessor :current_password

  def self.find_by_username_or_email(login)
    User.find_by_username(login) || User.find_by_email(login)
  end

  def deliver_welcome_email!
    SendWelcomeEmailJob.perform_later(self.id)
  end

  def deliver_verification_instructions!
    reset_perishable_token!
    SendVerificationInstructionsJob.perform_later(self.id)
  end

  def verify!
    self.verified = true
    self.save
  end
end
