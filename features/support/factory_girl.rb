
require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password 'testtest'
    password_confirmation 'testtest'
    admin true
  end
end
