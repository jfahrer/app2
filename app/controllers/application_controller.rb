class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate_user

  private

  def authenticate_user
    current_user.is_a?(User) ? true : access_denied
  end

  def current_user
    @current_user ||= User.find_by(auth_token: auth_token)
  end

  def access_denied
    head :forbidden
    false
  end

  def auth_token
    request.headers['Auth-Token']
  end
end
