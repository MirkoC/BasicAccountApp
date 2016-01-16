require 'rails_helper'
require 'authlogic/test_case'

include Authlogic::TestCase


RSpec.describe 'login', type: :feature do
  setup :activate_authlogic
  describe 'page' do
    it 'allows a user to login' do
      user = create(:user)
      user.update(verified: true) # not testing verification here
      expect(User.first).to be

      visit 'login'

      fill_in 'Username or email', with: 'test_user'
      fill_in 'Password', with: '1234'

      click_on 'Login'

      expect(page).to have_selector('h2', text: 'Home page')
    end
  end
end