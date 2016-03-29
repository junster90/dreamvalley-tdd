require 'rails_helper'
 
describe User do
  describe "mindvalley employees should" do
    it "be authorised" do
      user = User.create(first_name: "Vishen", last_name: "Lakhiani", email: "vishen@mindvalley.com", provider: "mindvalley", uid: "1")
      expect(User.authorised?(user)).to be_truthy
    end
  end

  describe "non mindvalley employees should" do
    it "not be authorised" do
      user = User.create(first_name: "Najib", last_name: "Razak", email: "najib@ambank.com", provider: "mindvalley", uid: "2")
      expect(User.authorised?(user)).to_not be_truthy
    end
  end

end
