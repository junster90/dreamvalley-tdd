require 'rails_helper'
 
describe User do
  describe "mindvalley employees should" do
    it "be authorised" do
      user = User.create(first_name: "Vishen", last_name: "Lakhiani", email: "vishen@mindvalley.com", provider: "mindvalley", uid: "1")
      User.authorised?(user).should be_truthy
    end
  end

  describe "non mindvalley employees should" do
    it "not be authorised" do
      user = User.create(first_name: "Najib", last_name: "Razak", email: "najib@ambank.com", provider: "mindvalley", uid: "2")
      User.authorised?(user).should_be_falsy
    end
  end
end