require 'rails_helper'

RSpec.describe UsersController, type: :controller do

# Not sure how to test omniauth yet.
  describe "POST #create" do
    context 'when the user is a new user' do
      xit "creates a new user and logs them in" do
        # expect{post(:create, params)}.to change(User, :count).by(1)
        expect(response).to have_http_status 302
        expect(session[:user_id]).to eq(User.last.id)
        expect(flash[:notice]).to eq("Signup successful!")
        expect(response).to redirect_to new_mutedphrase_path
      end
    end

    context "when the user is a returning user" do
      xit "logs the user in" do
        expect(response).to have_http_status 302
        expect(session[:user_id]).to eq(User.find(num).id)
        expect(flash[:notice]).to eq("Logged in!")
        expect(response).to redirect_to new_mutedphrase_path
      end
    end
  end
end
