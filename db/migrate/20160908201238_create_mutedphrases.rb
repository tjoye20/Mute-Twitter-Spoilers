class CreateMutedphrases < ActiveRecord::Migration[5.0]
  def change
    create_table :mutedphrases do |t|
      t.references :user, index: true
      t.string :phrase

      t.timestamps(null: false)
    end
  end
end
