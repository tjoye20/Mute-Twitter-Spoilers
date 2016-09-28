require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}

  describe "GET #new" do
    context "when there's no user logged in" do
      it "responds with status code 200" do
          get :new
          expect(response).to be_success
          expect(response).to have_http_status 200
          expect(response).to render_template(:new)
    end

    context "when there's a user logged in" do
      before(:each) do
        session[:user_id] = user.id
      end
      it "responds with status code 302" do
        get :new
        expect(response).to have_http_status 302
        expect(response).to redirect_to(new_mutedphrase_path)
      end
    end
  end
end

  describe "GET #failure" do
    it "responds with status code 302" do
      get :failure
      expect(response).to have_http_status 302
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("Sorry, but you didn't allow access to our app!")
    end
  end

  describe "DELETE #destroy" do
    it "logs you out and clears out the session" do
      delete :destroy
      expect(session[:user_id]).to eq nil
      expect(flash[:alert]).to eq("Logged out!")
      expect(response).to redirect_to root_path
    end
  end

end
