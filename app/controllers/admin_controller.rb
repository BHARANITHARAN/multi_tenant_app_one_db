class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
    # Logic for the admin dashboard
  end

  private

  def authenticate_admin
    unless current_user&.admin?
      redirect_to login_path, alert: 'Please log in as an admin to access this page.'
    end
  end
end
