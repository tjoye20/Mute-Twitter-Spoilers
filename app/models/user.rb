class User < ApplicationRecord

  has_many :mutedphrases
  has_many :mutedfollowers, through: :mutedphrases

  validates_presence_of :username, :token, :secret
  validates_uniqueness_of :username, :token, :secret
  validates_length_of :token, :secret, minimum: 10, too_short: "This entry is too short."
end
