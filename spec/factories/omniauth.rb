FactoryGirl.define do
  factory :mindvalley_auth_hash, class: OmniAuth::AuthHash do
    skip_create

    transient do
      sequence(:uid)
      provider "mindvalley"
      token SecureRandom.hex(10)
      id_token SecureRandom.hex(20)
    end

    trait :employee do 
      initialize_with do 
        OmniAuth::AuthHash.new({ 
          uid: uid, 
          provider: provider,
          info: { 
            first_name: "Vishen",
            last_name: "Lakhiani",
            email: "vishen@mindvalley.com"
          },
          credentials: {
            token: token,
            id_token: id_token
          }
        })
      end
    end

    trait :customer do 
      initialize_with do 
        OmniAuth::AuthHash.new({ 
          uid: uid, 
          provider: provider,
          info: { 
            first_name: "Najib",
            last_name: "Razak",
            email: "najib@ambank.com"
          },
          credentials: {
            token: token,
            id_token: id_token
          }
        })
      end
    end
  end
end