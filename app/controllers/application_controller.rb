class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate
    p ">"*80
    authenticate_or_request_with_http_basic do |id, password|
      id == "r33t" && password == "!badat"
    end
  end

end
