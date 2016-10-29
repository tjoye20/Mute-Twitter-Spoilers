class Phrase < ApplicationRecord
  belongs_to :user
  has_many :followers, through: :user

  validates_presence_of :phrase
  validates_length_of :phrase, minimum: 1, too_short: "This entry is too short."

  def self.mute_phrase(phrase_to_block, results, current_user, client)
    new_blocked_phrase = Phrase.create(
    phrase: phrase_to_block,
    user_id: current_user.id)
    array_of_screen_names = []
    array_of_tweets = []
    results.each do |tweet|
      if !array_of_screen_names.include?(tweet.user.screen_name)
        array_of_screen_names << tweet.user.screen_name
        array_of_tweets << tweet.text
      end
    end
    hash_of_tweets_and_names = array_of_screen_names.zip(array_of_tweets).to_h
    hash_of_tweets_and_names.each do |name, tweet|
      client.mute(name)
      Follower.create(
      user_id: current_user.id,
      phrase_id: new_blocked_phrase.id,
      screen_name: name,
      mutedtweet: tweet)
    end
  end

  def self.unmute_phrase(blocked_phrase_id, client)
    phrase = Phrase.find(blocked_phrase_id)
    followers = Follower.where(phrase_id: phrase.id)
    followers.each do |user|
      client.unmute(user.screen_name)
    end
    phrase.destroy
    followers.destroy_all
  end


end
