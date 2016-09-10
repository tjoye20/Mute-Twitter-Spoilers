require 'rails_helper'

RSpec.describe Mutedfollower, type: :model do
  let!(:valid_user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}
  let!(:new_phrase) {valid_user.mutedphrases.create(phrase: "test phrase")}

  context "when valid params are passed" do
    it "saves a new muted follower" do
      muted_follower = valid_user.mutedphrases.first.mutedfollowers.create(user_id: valid_user.id, screen_name: 'testing101')
      expect(muted_follower.valid?).to eq true
      expect(Mutedfollower.first).to eq muted_follower
      expect(muted_follower.id).to eq 1
      expect(valid_user.mutedfollowers).to eq [muted_follower]
    end
  end

  context "when invalid params are passed" do
    it "doesn't save a new muted follower" do

    end
  end
end
