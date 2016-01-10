class SendWelcomeEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    UserMailer.welcome(User.find_by_id(user_id)).deliver
  end
end
