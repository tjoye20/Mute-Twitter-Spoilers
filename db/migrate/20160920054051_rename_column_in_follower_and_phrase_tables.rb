class RenameColumnInFollowerAndPhraseTables < ActiveRecord::Migration[5.0]
  def change
    rename_column :followers, :mutedphrase_id, :phrase_id
  end
end
