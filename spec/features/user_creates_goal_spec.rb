require "rails_helper"
Warden.test_mode!

RSpec.feature "User creates goal" do
  before do
    user = FactoryGirl.create(:user)
    login_as(user)
  end

  scenario "they can create goals" do
    visit new_goal_path
    select 'What do I want to experience in life?', from: 'goal[category]'
    fill_in 'goal[description]', with: 'I want to travel Europe!'
    click_button 'Submit'

    expect(response).to be_success
  end

  scenario "empty fields are not allowed" do
    visit new_goal_path
    select 'What do I want to experience in life?', from: 'goal[category]'
    click_button 'Submit'

    expect(page).to have_text 'Please fill out this field.'
  end
end