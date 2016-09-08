class ChangePhraseColumnInMutedphrasesTable < ActiveRecord::Migration[5.0]
  def change
    change_column :mutedphrases, :phrase, :string, null: false 
  end
end
