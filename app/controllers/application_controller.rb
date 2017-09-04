class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  # Handle some errors
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  def handle_error
    redirect_to root_url
  end

end
