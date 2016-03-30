require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  subject { get :index }
  describe '#index' do
    it "assigns random goals to instance" do
      5.times {FactoryGirl.create(:goal)}
      subject
      expect{assigns(:random_goals)}.to have_at_least(5).items
      expect{assigns(:random_goals)}.to all(be_an_instance_of(Goal))
    end

    it "renders the index page" do
      expect(subject).to render_template(:index)
    end
  end
end
