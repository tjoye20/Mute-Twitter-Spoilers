class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :phrase

  validates_presence_of :screen_name
  validates_length_of :screen_name, minimum: 1, too_short: "This entry is too short."

  protected

  def self.mute_follower(hash_of_tweets_and_names, new_blocked_phrase_id, current_user, client)
    hash_of_tweets_and_names.each do |name, tweet|
      client.mute(name)
      Follower.create(
      user_id: current_user.id,
      phrase_id: new_blocked_phrase_id,
      screen_name: name,
      mutedtweet: tweet)
    end
  end

  def self.unmute_followers(phrase_id, client)
    followers = Follower.where(phrase_id: phrase_id)
    followers.each do |user|
      client.unmute(user.screen_name)
    end
    followers.destroy_all
  end
end
