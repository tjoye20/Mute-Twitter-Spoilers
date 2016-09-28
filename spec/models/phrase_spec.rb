require 'rails_helper'

RSpec.describe Phrase, type: :model do
  let!(:valid_user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}

  context "when valid params are passed" do
    it "saves a new muted phrase" do
      new_phrase = valid_user.phrases.create(phrase: "test phrase")
      expect(new_phrase.valid?).to eq true
      expect(Phrase.all).to eq [new_phrase]
      expect(new_phrase.phrase).to eq "test phrase"
      expect(valid_user.phrases).to eq [new_phrase]
    end
  end

  context "when invalid params are passed" do
    it "raises errors and doesn't save a new record" do
      new_phrase = valid_user.phrases.create(phrase: "")
      expect(new_phrase.valid?).to eq false
      expect(Phrase.all.length).to eq 0
      expect(new_phrase.id).to eq nil
    end
  end

end
