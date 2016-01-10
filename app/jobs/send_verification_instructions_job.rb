class SendVerificationInstructionsJob < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    UserMailer.verification_instructions(User.find_by_id(user_id)).deliver
  end
end
