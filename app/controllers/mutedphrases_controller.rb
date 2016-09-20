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
    @phrase = params[:phrase]
    @results = search_results(@phrase)
    if @results.empty?
      redirect_to new_mutedphrase_path, notice: "There were no tweets about '#{@phrase}' on your timeline right now. Please search something else."
    end
  end

  def create
    phrase_to_block = params[:phrase]
    mute_phrase(phrase_to_block)
    redirect_to mutedphrases_path
  end

  def show_tweets
    @phrase = session[:search_phrase]
    @results = search_results(@phrase)
  end

  def show
    @mutedphrase = Phrase.find(params[:phrase_id])
    #in view, run @muted_phrase.mutedfollowers
    #don't show tweets
  end

  def destroy
    unmute_phrase(params[:phrase_id])
    redirect_to mutedphrases_path
  end
end
