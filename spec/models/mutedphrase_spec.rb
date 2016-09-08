require 'rails_helper'

RSpec.describe Mutedphrase, type: :model do
  let!(:valid_user) {User.create(username: "tjo", token: "hfajf8uuafaj", secret: "tlkjer09984r0=3")}

  context "when valid params are passed" do
    it "saves a new muted phrase" do

    end
  end

  context "when invalid params are passed" do
    it "raises errors and doesn't save a new record" do

    end
  end

end
