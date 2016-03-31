require "rails_helper"
include Warden::Test::Helpers
Warden.test_mode!

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

  scenario "they can login" do
    visit root_path
    expect(page).to have_link "Login", href: login_path
  end

  scenario "see their name when they're logged in" do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit root_path
    expect(page).to have_text "#{user.first_name}"
  end
end
