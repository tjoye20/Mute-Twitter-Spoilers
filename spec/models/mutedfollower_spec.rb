require 'rails_helper'

RSpec.describe Mutedfollower, type: :model do
  let!(:valid_user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}
  let!(:new_phrase) {valid_user.mutedphrases.create(phrase: "test phrase")}

  context "when valid params are passed" do
    it "saves the muted follower" do
      new_muted_follower = new_phrase.mutedfollowers.create(screen_name: "tjonem", user_id: valid_user.id)
      expect(new_muted_follower.valid?).to eq true
      expect(Mutedfollower.all).to eq [new_muted_follower]
      expect(new_muted_follower.id).to eq 1
      expect(new_phrase.mutedfollowers).to eq [new_muted_follower]
    end
  end

  context "when invalid params are passed" do

  end
end
