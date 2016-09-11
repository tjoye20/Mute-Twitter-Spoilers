class UsersController < ApplicationController

  def create
    @access_token = request_token.get_access_token(oauth_verifier: params[:oauth_verifier])
    session[:request_token] = nil
    user = nil
      if !(User.find_by(username: @access_token.params[:screen_name]))
        user = User.create(
        username: @access_token.params[:screen_name],
        token: @access_token.token,
        secret: @access_token.secret
        )
      else
        user = User.find_by(username: @access_token.params[:screen_name])
      end
    session[:user_id] = user.id
    redirect_to new_mutedphrase_path
  end

end
