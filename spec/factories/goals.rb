FactoryGirl.define do
  factory :goal do
    association :user, factory: :user
    sequence :description do |n|
      "I want to sample description #{n}"
    end

    after(:build) do |g|
      random_user_id = (1..5).to_a.sample
      g.type = Goal.type.values.sample
    end

    trait :no_type do
      after(:build) do |g|
        g.type = nil
      end
    end

    trait :no_description do
      after(:build) do |g|
        g.description = nil
      end
    end

    trait :no_user do
      after(:build) do |g|
        g.user = nil
      end
    end
  end
end
