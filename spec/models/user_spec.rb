require 'rails_helper'
 
describe User do

  describe "mindvalley employees" do
    auth_hash = FactoryGirl.create(:mindvalley_auth_hash, :employee)

    it "should be authorised" do
      user = User.new
      user.assign_from_omniauth(auth_hash)
      expect(User.authorised?(user)).to be_truthy
    end

    it "can create accounts" do 
      expect(User.from_omniauth(auth_hash)).to_not be_nil
    end
  end

  describe "non mindvalley employees" do
    auth_hash = FactoryGirl.create(:mindvalley_auth_hash, :customer)

    it "should not be authorised" do
      user = User.new
      user.assign_from_omniauth(auth_hash)
      expect(User.authorised?(user)).to_not be_truthy
    end

    it "cannot create accounts" do
      expect(User.from_omniauth(auth_hash)).to be_nil
    end
  end
end