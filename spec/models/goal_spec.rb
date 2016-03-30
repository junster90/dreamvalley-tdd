require 'rails_helper'

RSpec.describe Goal, type: :model do
  it "should have a description" do
    expect(FactoryGirl.build(:goal, :no_description)).to_not be_valid
  end

  it "should belong to a type" do
    expect(FactoryGirl.build(:goal, :no_category)).to_not be_valid
  end

  it "should belong to a user" do
    expect(FactoryGirl.build(:goal, :no_user)).to_not be_valid
  end
end