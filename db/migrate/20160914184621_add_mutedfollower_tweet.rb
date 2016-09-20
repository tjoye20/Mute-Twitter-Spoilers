class AddMutedfollowerTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :mutedfollowers, :mutedtweet, :text, null: false
  end
end
