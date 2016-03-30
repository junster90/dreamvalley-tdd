require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe '#new' do
    context "user not logged in" do
      it "sends user to login" do
        sign_in(nil)
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "user is logged in" do
      it "allows user to access creation page" do
        sign_in
        get :new
        expect(response).to be_success
      end
    end
  end
end
