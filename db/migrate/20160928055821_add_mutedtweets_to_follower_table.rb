class AddMutedtweetsToFollowerTable < ActiveRecord::Migration[5.0]
  def change
    add_column :followers, :mutedtweet, :text 
  end
end
