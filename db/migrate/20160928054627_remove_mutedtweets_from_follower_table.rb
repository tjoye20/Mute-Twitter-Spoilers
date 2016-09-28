class RemoveMutedtweetsFromFollowerTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :followers, :mutedtweet
  end
end
