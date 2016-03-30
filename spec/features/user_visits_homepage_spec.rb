require "rails_helper"

RSpec.feature "User visits homepage" do
  scenario "they can see random goals" do
    goal = FactoryGirl.create(:goal)
    visit root_path
    expect(page).to have_text goal.description
  end

  scenario "they can create new goals" do
    visit root_path
    expect(page).to have_link "Write your own today!", href:new_goal_path
  end
end
