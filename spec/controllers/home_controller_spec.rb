require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  subject { get :index }
  describe '#index' do
    it "assigns 8 random goals to instance" do
      10.times {FactoryGirl.create(:goal)}
      subject
      expect(assigns(:random_goals)).to be_an_instance_of(Array)
      expect(assigns(:random_goals).size).to eq(8)
      expect(assigns(:random_goals)).to all(be_an_instance_of(Goal))
    end

    it "renders the index page" do
      expect(subject).to render_template(:index)
    end
  end
end
