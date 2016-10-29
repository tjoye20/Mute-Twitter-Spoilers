class MutedphrasesController < ApplicationController
  def index
    if Phrase.where(user_id: current_user.id).empty?
      redirect_to new_mutedphrase_path, notice: "Sorry, you don't have any muted phrases right now. Search for a phrase you want to mute."
    else
      @mutedphrases = Phrase.where(user_id: current_user.id)
    end
  end

  def new
  end

  def results
    session[:search_phrase] = params[:phrase]
    @phrase = session[:search_phrase]
    @results = search_results(@phrase)
    if @results.empty?
      redirect_to new_mutedphrase_path, notice: "There were no tweets about '#{@phrase}' on your timeline right now. Please search something else."
    end
  end

  def create
    phrase_to_block = session[:search_phrase]
    results = search_results(phrase_to_block)
    Phrase.mute_phrase(phrase_to_block, results, current_user, client)
    redirect_to mutedphrases_path
  end

  def show_tweets
    @phrase = session[:search_phrase]
    @results = search_results(@phrase)
  end

  def show
    @mutedphrase = Phrase.find(params[:id])
    @followers = Follower.where(phrase_id: @mutedphrase.id)
  end

  def destroy
    Phrase.unmute_phrase(params[:id], client)
    redirect_to mutedphrases_path
  end

  private

  def search_results(phrase_to_block)
    user_timeline = client.home_timeline(
    count: 100, exclude_replies: true)
    results = []
    user_timeline.each do |tweet|
      if tweet.text.downcase.include?(phrase_to_block.downcase) && (tweet.user.screen_name != current_user.username)
        results << tweet
      end
    end
    results
  end

  # def mute_phrase(phrase_to_block)
  #   results = search_results(phrase_to_block)
  #   new_blocked_phrase = Phrase.create(
  #   phrase: phrase_to_block,
  #   user_id: current_user.id)
  #   array_of_screen_names = []
  #   array_of_tweets = []
  #   results.each do |tweet|
  #     if !array_of_screen_names.include?(tweet.user.screen_name)
  #       array_of_screen_names << tweet.user.screen_name
  #       array_of_tweets << tweet.text
  #     end
  #   end
  #   hash_of_tweets_and_names = array_of_screen_names.zip(array_of_tweets).to_h
  #   hash_of_tweets_and_names.each do |name, tweet|
  #     client.mute(name)
  #     Follower.create(
  #     user_id: current_user.id,
  #     phrase_id: new_blocked_phrase.id,
  #     screen_name: name,
  #     mutedtweet: tweet)
  #   end
  # end
  #
  # def unmute_phrase(blocked_phrase_id)
  #   phrase = Phrase.find(blocked_phrase_id)
  #   followers = Follower.where(phrase_id: phrase.id)
  #   followers.each do |user|
  #     client.unmute(user.screen_name)
  #   end
  #   phrase.destroy
  #   followers.destroy_all
  # end

end
