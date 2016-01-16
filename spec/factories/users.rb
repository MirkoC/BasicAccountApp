FactoryGirl.define do
  factory :user do
    username 'test_user'
    email 'example@example.com'
    full_name 'Test User'
    password '1234'
    password_confirmation '1234'
  end
end