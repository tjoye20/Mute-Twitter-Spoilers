class UsersController < ApplicationController

  def create
    if params[:denied]
      redirect_to sessions_path
    else
      if !(User.find_by(username: auth_hash.info.nickname))
        @user = User.create_user(auth_hash)
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
