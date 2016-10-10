FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "myemail_#{n}@email.com" }
    password '12345678'
  end
end
