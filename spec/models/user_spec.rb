require 'rails_helper'
 
describe User do

  describe "mindvalley employees" do
    auth_hash = FactoryGirl.create(:mindvalley_auth_hash, :employee)

    it "should be authorised" do
      user = User.new.assign_from_omniauth(auth_hash)
      expect(User.authorised?(user)).to be_truthy
    end

    it "can create an account with omniauth" do 
      expect{User.from_omniauth(auth_hash)}.to change{User.count}.by(1)
    end
  end

  describe "non mindvalley employees" do
    auth_hash = FactoryGirl.create(:mindvalley_auth_hash, :customer)

    it "should not be authorised" do
      user = User.new.assign_from_omniauth(auth_hash)
      expect(User.authorised?(user)).to_not be_truthy
    end

    it "cannot create an account with omniauth" do
      expect{User.from_omniauth(auth_hash)}.to_not change{User.count}
    end
  end
end