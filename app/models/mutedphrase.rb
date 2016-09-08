class Mutedphrase < ApplicationRecord
  belongs_to :user
  has_many :mutedfollowers
end
