class User < ApplicationRecord

  validates_presence_of :username, :token, :secret
  validates_uniqueness_of :username, :token, :secret
  validates_length_of :token, :secret, minimum: 10, too_short: "This entry is too short."
end
