require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  subject { get :index }
  describe '#index' do
    it "assigns random goals to instance" do
      5.times {FactoryGirl.create(:goal)}
      subject
      expect{assigns(:random_goals)}.to eq Goal.all
    end

    it "renders the index page" do
      expect(subject).to render_template(:index)
    end
  end
end
