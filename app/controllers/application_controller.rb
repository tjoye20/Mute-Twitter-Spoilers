class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :all

  private

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id])
  end

  def oauth_consumer
    if !(ENV["CONSUMER_KEY"] && ENV["CONSUMER_SECRET"])
      raise RuntimeError, "You must set CONSUMER_KEY and CONSUMER_SECRET in your server environment."
    else
      @consumer ||= OAuth::Consumer.new(
      ENV["CONSUMER_KEY"],
      ENV["CONSUMER_SECRET"],
      site: "https://api.twitter.com")
    end
  end

  def request_token
    if !session[:request_token]
      host_and_port = request.host
      if request.host == "localhost"
        host_and_port << ":3000"
      end
      session[:request_token] = oauth_consumer.get_request_token(oauth_callback: "http://#{host_and_port}/auth")
    end
    session[:request_token]
  end

end
