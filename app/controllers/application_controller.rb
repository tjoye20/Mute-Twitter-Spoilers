class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :all

  private

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id])
  end

  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end
  end

  def search_results(phrase_to_block)
    user_timeline = client.home_timeline(
    count: 100, exclude_replies: true)
    @results = []
    user_timeline.each do |tweet|
      if tweet.text.downcase.include?(phrase_to_block)
        @results << tweet
      end
    end
    @results
  end

  def mute_phrase(phrase_to_block)
    results = search_results(phrase_to_block)
    new_blocked_phrase = Phrase.create(
    phrase: phrase_to_block,
    user_id: current_user.id)

    results.each do |tweet|
      client.mute(tweet.user.screen_name)
      Follower.create(
      user_id: current_user.id,
      phrase_id: new_blocked_phrase.id,
      screen_name: tweet.user.screen_name,
      mutedtweet: tweet.text)
    end
  end

  def unmute_phrase(blocked_phrase_id)
    phrase = Phrase.find(blocked_phrase_id)
    followers = Follower.where(phrase_id: phrase.id)
    followers.each do |user|
      client.unmute(user.screen_name)
    end
    phrase.destroy
    followers.destroy_all
  end

end
