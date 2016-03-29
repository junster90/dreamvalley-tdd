require 'rails_helper'
 
describe User do
  describe "mindvalley employees should" do
    it "be authorised" do
      user = FactoryGirl.create(:employee)
      expect(User.authorised?(user)).to be_truthy
    end
  end

  describe "non mindvalley employees should" do
    it "not be authorised" do
      user = FactoryGirl.create(:customer)
      expect(User.authorised?(user)).to_not be_truthy
    end
  end

end