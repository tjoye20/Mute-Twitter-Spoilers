class RenameMutedPhrases < ActiveRecord::Migration[5.0]
  def change
    rename_table :mutedfollowers, :muted_followers
    rename_table :mutedphrases, :muted_phrases  
  end
end
