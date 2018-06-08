class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def basic
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV["BASIC_USER"] && pass = ENV["BASIC_PASS"]
    end
  end
end
