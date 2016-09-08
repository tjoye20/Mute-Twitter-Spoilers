class Mutedphrase < ApplicationRecord
  belongs_to :user
  has_many :mutedfollowers

  validates_presence_of :phrase
  validates_length_of :phrase, minimum: 1, too_short: "This entry is too short."
end
