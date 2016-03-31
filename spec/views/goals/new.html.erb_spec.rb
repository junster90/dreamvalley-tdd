require "rails_helper"

RSpec.describe "goals/new.html.erb" do
  describe "the form is properly displayed" do
    before do
      render
    end

    it "has a category selector" do
      expect(rendered).to have_selector(:id, 'goal_category')
    end

    it 'has a description field' do
      expect(rendered).to have_selector(:id, 'goal_description')
    end

    it 'has a submit button' do
      expect(rendered).to have_button('Submit')
    end
  end
end
