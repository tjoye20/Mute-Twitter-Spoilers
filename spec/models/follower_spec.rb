require 'rails_helper'

RSpec.describe Follower, type: :model do
  let!(:valid_user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}
  let!(:new_phrase) {valid_user.phrases.create(phrase: "test phrase")}

  context "when valid params are passed" do
    it "saves a new muted follower" do
      muted_follower = Follower.create(user_id: valid_user.id, phrase_id: new_phrase.id, screen_name: 'testing101', mutedtweet: "this is a test phrase")
      expect(muted_follower.valid?).to eq true
      expect(Follower.first).to eq muted_follower
      expect(muted_follower.id).to eq 1
    end
  end

  context "when invalid params are passed" do
    it "doesn't save a new muted follower" do
      muted_follower = Follower.create(user_id: valid_user.id, phrase_id: new_phrase.id, screen_name: '')
      expect(muted_follower.valid?).to eq false
      expect(Follower.all.length).to eq 0
      expect(muted_follower.id).to eq nil
      expect(muted_follower.errors.any?).to eq true
    end
  end
end
