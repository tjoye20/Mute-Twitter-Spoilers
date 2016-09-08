class CreateBlockedphrases < ActiveRecord::Migration[5.0]
  def change
    create_table :blockedphrases do |t|
      t.references :user, index: true
      t.references :mutedphrase, index: true
      t.string :screen_name, null: false

      t.timestamps(null: false)
    end
  end
end
