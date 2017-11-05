FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "carmen#{n}@example.com"}
    first_name 'Carmen'
    last_name 'Martinez'
    password 'password11'
    password_confirmation 'password11'
  end
end
