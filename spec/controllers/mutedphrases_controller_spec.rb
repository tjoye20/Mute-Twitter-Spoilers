require 'rails_helper'

RSpec.describe MutedphrasesController, type: :controller do
  let!(:user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}
  let!(:phrase_to_block) {"NFL"}
  # let!(:results) {search_results(phrase_to_block)}
  let(:new_muted_phrase) {Phrase.create()}
  let(:new_muted_follower) {Follower.create()}

#not yet sure how to handle APIs wrapped in helper methods w/ RSpec
#these tests are not yet complete. Have to study more RSpec
# in order to add the helper methods and mock the TWitter API results

  describe "GET #index" do
      xit "responds with status code 200" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status 200
        expect(results.nil?).to eq false
        expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    xit "responds with status code 200" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status 200
      expect(response).to render_template(:new)
    end
  end

  describe "GET #results" do
    xit "responds with status code 200" do
      get :results
      expect(response).to be_success
      expect(response).to have_http_status 200
      expect(response).to render_template(:results)
    end
  end

  describe "GET #show" do
    xit "responds with status code 200" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status 200
      expect(response).to render_template(:show)
    end
  end

  describe "GET #show_tweets" do
    xit "responds with status code 200" do
      get :show_tweets
      expect(response).to be_success
      expect(response).to have_http_status 200
      expect(response).to render_template(:show_tweets)
    end
  end

  describe "POST #create" do
    xit "responds with status code 302" do
      post :create
      # expect{post(:create, params)}.to change(Mutedphrase, :count).by(1)
      expect(Phrase.all).to eq 2
      expect(Phrase.last.id).to eq new_muted_phrase.id
      expect(Follower.all).to eq 2
      expect(Follower.last.id).to eq new_muted_follower.id
      expect(response).to have_http_status 302
      expect(response).to redirect_to(mutedphrases_path)
    end
  end

  describe "DELETE #destroy" do
    xit "logs you out and clears out the session" do
      delete :destroy
      expect(Phrase.all).to eq 1
      expect(Phrase.first).to eq new_muted_phrase
      expect(Follower.all).to eq 1
      expect(Follower.first).to eq new_muted_follower
      expect(response).to have_http_status 302
      expect(response).to redirect_to(mutedphrases_path)
    end
  end

end
