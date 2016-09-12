class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :all

  private

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id])
  end

  # def oauth_consumer
  #   if !(ENV["CONSUMER_KEY"] && ENV["CONSUMER_SECRET"])
  #     raise RuntimeError, "You must set CONSUMER_KEY and CONSUMER_SECRET in your server environment."
  #   else
  #     @consumer ||= OAuth::Consumer.new(
  #     ENV["CONSUMER_KEY"],
  #     ENV["CONSUMER_SECRET"],
  #     site: "https://api.twitter.com")
  #   end
  # end
  #
  # def callback_url
  #   @host_and_port = request.host
  #   if request.host == "localhost"
  #     @host_and_port << ":3000"
  #   end
  #   "http://#{@host_and_port}/auth"
  # end
  #
  # def request_token
  #   if !@req_token
  #     @req_token = oauth_consumer.get_request_token(oauth_callback: callback_url)
  #   end
  #     @req_token
  # end

  # I refactored this method to not use sessions, b/c
  # the session was returning a sessions hash and not the
  # OAuth::Request_token object needed.

  #reference: http://devblog.songkick.com/2012/10/24/get-your-objects-out-of-my-session/

  # def request_token
  #   if !session[:request_token]
  #     host_and_port = request.host
  #     if request.host == "localhost"
  #       host_and_port << ":3000"
  #     end
  #     session[:request_token] = oauth_consumer.get_request_token(oauth_callback: "http://#{host_and_port}/auth")
  #   end
  #   session[:request_token]
  # end

end
