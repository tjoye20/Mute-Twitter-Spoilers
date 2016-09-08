class Users < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :token, null: false
      t.string :secret, null: false

      t.timestamps(null: false)
    end
  end
end
