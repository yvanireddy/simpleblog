class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
def current_user
	@current_user ||=Post.find(session[:id]) if session[:id]
end
helper_method :current_user
end
