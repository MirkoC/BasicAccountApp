class UserSession < Authlogic::Session::Base
  find_by_login_method :find_by_username_or_email

  validate :check_if_verified

  private

  def check_if_verified
    if attempted_record
      errors.add(:base, 'You have not yet verified your account') unless attempted_record.verified
    end
  end
end