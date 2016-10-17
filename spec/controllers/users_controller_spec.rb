require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  describe "POST #create" do
    context "when the user is a new user" do
      it "creates a user and redirects to new_mutedphrase_path" do
        expect {
          post :create, provider: :twitter
        }.to change{ User.count }.by(1)
        expect(session[:user_id]).to_not be_nil
        expect(response).to have_http_status 302
        expect(response).to redirect_to new_mutedphrase_path
      end
    end

    context "when it's a RETURNING user" do
      before do
        User.create(username: "tjo",
        token: "123595",
        secret: "jfajflajfa8980")
      end

      it "finds the user and redirects to new_mutedphrase_path" do
        post :create, provider: :twitter
        expect(User.find_by(username: 'tjo')).to be_a User 
        expect(session[:user_id]).to_not be_nil
        expect(response).to redirect_to new_mutedphrase_path
        expect(response).to have_http_status 302
        expect(response).to redirect_to new_mutedphrase_path
      end
    end
  end
end
