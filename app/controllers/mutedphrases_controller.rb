class MutedphrasesController < ApplicationController
  def index
    if Phrase.where(user_id: current_user.id).empty?
      redirect_to new_mutedphrase_path, notice: "Sorry, you don't have any muted phrases right now. Search for a phrase you want to mute."
    else
      @mutedphrases = Phrase.where(user_id: current_user.id)
    end
  end

  def results
    session[:search_phrase] = params[:phrase]
    @results = search_results(session[:search_phrase])
    if @results.empty?
      redirect_to new_mutedphrase_path, notice: "There were no tweets about '#{session[:search_phrase]}' on your timeline right now. Please search something else."
    end
  end

  def create
    results = search_results(session[:search_phrase])
    hash_of_tweets_and_names = Phrase.mute_phrase_return_hash(session[:search_phrase], results, current_user)
    Follower.mute_follower(hash_of_tweets_and_names, Phrase.last.id, current_user, client)
    redirect_to mutedphrases_path
  end

  def show_tweets
    @results = search_results(session[:search_phrase])
  end

  def show
    @mutedphrase = Phrase.find(params[:id])
    @followers = Follower.where(phrase_id: @mutedphrase.id)
  end

  def destroy
    phrase = Phrase.find(params[:id])
    Follower.unmute_followers(phrase.id, client)
    phrase.destroy
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

end
