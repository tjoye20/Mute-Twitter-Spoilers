require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status 200
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status 302
      expect(response).to redirect_to("https://api.twitter.com")
    end
  end


# not sure how to test the create action for oauth
  # describe "POST #create" do
  #   context "uses the autheticated user info to create a new User" do
  #
  #   end
  # end



  describe "DELETE #destroy" do
    it "logs you out and clears out the session" do
      delete :destroy
      expect(session[:user_id]).to eq nil
      expect(flash[:notice]).to eq("Logged out!")
      expect(response).to redirect_to root_path
    end
  end

end
