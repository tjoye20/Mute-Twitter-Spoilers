class MutedphrasesController < ApplicationController
  def index
    @mutedphrases = Mutedphrase.where(user_id: current_user.id)
  end

  def new
  end

  def results
    @results = search_results(params[:phrase])
  end

  def create
    phrase_to_block = params[:phrase]
    mute_phrase(phrase_to_block)
    redirect_to mutedphrases_path
  end

  def show
    @mutedphrase = MutedPhrase.find(params[:phrase_id])
    #in view, run @muted_phrase.mutedfollowers
    #don't show tweets
  end

  def show_tweets
    @results = search_results(params[:phrase])
  end

  def destroy
    unmute_phrase(params[:phrase_id])
    redirect_to mutedphrases_path
  end
end
