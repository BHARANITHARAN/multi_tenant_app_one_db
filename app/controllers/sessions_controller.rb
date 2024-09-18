class SessionsController < ApplicationController
  def new
  end

  def create
    author = Author.find_by(email: params[:email])
    if author&.authenticate(params[:password])
      # Log in the user (set session or token)
      session[:author_id] = author.id
      if author.admin?
        redirect_to authors_path
      else
        redirect_to articles_url(subdomain: author.domain), allow_other_host: true
      end
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
