class Phrase < ApplicationRecord
  belongs_to :user
  has_many :followers, through: :user

  validates_presence_of :phrase
  validates_length_of :phrase, minimum: 1, too_short: "This entry is too short."
end
