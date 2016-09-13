class UsersController < ApplicationController

  def create
    if params[:denied]
      redirect_to sessions_path
    else
      # profile image: auth_hash.info[:image]
      if !(User.find_by(username: auth_hash.info.nickname))
        @user = User.create(
        username: auth_hash.info.nickname,
        token: auth_hash.credentials.token,
        secret: auth_hash.credentials.secret
        )
      else
        @user = User.find_by(username: auth_hash.info.nickname)
      end
      session[:user_id] = @user.id
      redirect_to new_mutedphrase_path
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
