FactoryGirl.define do
  factory :user do
    first_name "user"
    sequence :last_name do |n|
      "#{n}"
    end
    sequence :email do |user_id|
      "user#{user_id}@example.com"
    end
    password "password"
    password_confirmation "password"
  end
end