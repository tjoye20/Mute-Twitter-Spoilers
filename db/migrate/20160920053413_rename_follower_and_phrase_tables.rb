class RenameFollowerAndPhraseTables < ActiveRecord::Migration[5.0]
  def change
    rename_table :muted_followers, :followers
    rename_table :muted_phrases, :phrases 
  end
end
