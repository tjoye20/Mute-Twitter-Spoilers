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
    mute_phrase(phrase_to_block)
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
    unmute_phrase(params[:id])
    redirect_to mutedphrases_path
  end
end
