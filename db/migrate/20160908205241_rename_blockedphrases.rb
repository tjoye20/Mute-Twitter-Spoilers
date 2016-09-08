class RenameBlockedphrases < ActiveRecord::Migration[5.0]
  def change
    rename_table :blockedphrases, :mutedfollowers 
  end
end
