require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:valid_user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}
  let(:invalid_user) {User.create(username: "tj", token: "", secret: "")}

  context "when passed valid params" do
    it "creates a user" do
      expect(valid_user.valid?).to eq true
      expect(valid_user.username).to eq "tjo"
      expect(User.all).to eq [valid_user]
    end
  end

  context "when params are invalid" do
    it "raises errors" do
      expect(invalid_user.valid?).to eq false
      expect(invalid_user.id).to eq nil
      expect(invalid_user.errors).to have_key :token
      expect(invalid_user.errors).to have_key :secret
      expect(User.all).to eq [valid_user]
    end
  end
end
