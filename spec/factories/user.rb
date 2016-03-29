FactoryGirl.define do 
  factory :employee, class: User do
    first_name "Vishen"
    last_name "Lakhiani"
    email "vishen@mindvalley.com"
    provider "mindvalley"
    uid "1"
  end

  factory :customer, class: User do
    first_name "Najib"
    last_name "Razak"
    email "najib@ambank.com.my"
    provider "mindvalley"
    uid "2"
  end
end