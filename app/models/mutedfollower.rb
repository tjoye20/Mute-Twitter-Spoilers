class Mutedfollower < ApplicationRecord
  belongs_to :user
  belongs_to :mutedphrase

  validates_presence_of :screen_name
end
