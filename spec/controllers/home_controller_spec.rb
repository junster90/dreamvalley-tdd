require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  subject { get :index }
  describe '#index' do
    it "assigns 10 random goals to instance" do
      10.times {FactoryGirl.create(:goal)}
      subject
      expect(assigns(:random_goals)).to be_an_instance_of(Array)
      expect(assigns(:random_goals)).should have(10).items
      expect(assigns(:random_goals)).to all(be_an_instance_of(Goal))
    end

    it "renders the index page" do
      expect(subject).to render_template(:index)
    end
  end
end
