class SessionsController < ApplicationController

  #login page
  def index
  end

  #Starts OAuth process. Callsback to users#create
  def new
    if !current_user
      redirect request_token.authorize_url
    else
      redirect_to new_mutedphrase_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end
end
