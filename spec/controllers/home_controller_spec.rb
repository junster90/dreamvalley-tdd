require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  subject { get :index }
  describe '#index' do
    context "returns a maximum of 8 random goals" do
      before do
        10.times {FactoryGirl.create(:goal)}
        subject
      end

      it "returns an array" do 
        expect(assigns(:random_goals)).to be_an_instance_of(Array)
      end

      it "has 8 items" do
        expect(assigns(:random_goals).size).to be <= 8
      end

      it "contains nothing but goals" do
        expect(assigns(:random_goals)).to all(be_an_instance_of(Goal))
      end
    end

    it "renders the index page" do
      expect(subject).to render_template(:index)
    end
  end
end
