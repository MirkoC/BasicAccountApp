class SendPasswordResetMailJob < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    UserMailer.password_reset_instructions(User.find_by_id(user_id)).deliver
  end
end
