class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = 'You must log in to access this section'
      redirect_to root_path
      # redirect_to '/login' unless request.subdomain.blank?
    end
  end
end
