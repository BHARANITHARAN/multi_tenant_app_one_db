class PagesController < ApplicationController
  before_action :redirect_based_on_login
  def home
  end

  def redirect_based_on_login
    if current_user
      if current_user.admin?
        # If the user is an admin, redirect to the authors index page
        redirect_to authors_path
      else
        # If the user is not an admin, redirect to their subdomain's articles index
        redirect_to articles_url(subdomain: current_user.domain), allow_other_host: true
      end
    else
      # If the user is not logged in, redirect to the login page
      redirect_to login_path
    end
  end
end
