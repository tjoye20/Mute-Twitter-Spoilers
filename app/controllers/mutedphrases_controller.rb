class MutedphrasesController < ApplicationController
  def index
    @mutedphrases = Mutedphrase.where(user_id: current_user.id)
  end

  def new
  end

  def results
    @results = search_results(params[:phrase_to_block])
  end

  def create
    phrase_to_block = params[:phrase_to_block]
    mute_phrase(phrase_to_block)
    redirect_to mutedphrases_path
  end

  def show
    @Muted_phrase = MutedPhrase.find(params[:phrase_id])
    #in view, run @muted_phrase.mutedfollowers
    #don't show tweets
  end

  def show_tweets
    @Muted_phrase = MutedPhrase.find(params[:phrase_id])
    #in view, run @muted_phrase.mutedfollowers
    #show tweets in this view.
  end

  def destroy
    unmute_phrase(params[:phrase_id])
    redirect_to mutedphrases_path
  end
end
