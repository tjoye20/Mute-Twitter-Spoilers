class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :phrase

  validates_presence_of :screen_name
  validates_length_of :screen_name, minimum: 1, too_short: "This entry is too short."
end
