require "rails_helper"
Warden.test_mode!

RSpec.feature "User creates goal" do
  before do
    user = FactoryGirl.create(:user)
    login_as(user)
  end

  scenario "they see the goal creation form" do
    visit new_goal_path
    Capybara.default_selector = :css
    expect(page).to have_selector("input")
  end

end