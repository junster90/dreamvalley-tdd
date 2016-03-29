FactoryGirl.define do
  factory :goal do
    type :contribution
    description "MyText"
    user User.new(id: 1, email: "example@example.com")

    trait :no_type do
      type nil
    end

    trait :no_description do
      description nil
    end

    trait :no_user do
      user nil
    end
  end
end
