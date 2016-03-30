require "rails_helper"

RSpec.feature "User visits homepage" do
  scenario "they can see random goals" do
    byebug
    goal = FactoryGirl.create(:goal)
    visit root_path
    expect(page).to have_text goal.description
  end
end
