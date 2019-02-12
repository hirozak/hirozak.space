class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  before_action :basic, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :render_404 if Rails.env.production?
  rescue_from ActionController::RoutingError, with: :render_404 if Rails.env.production?
  rescue_from Exception, with: :render_500 if Rails.env.production?

  def render_404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if exception
    render template: 'errors/error_404', status: :not_found, layout: 'application'
  end

  def render_500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception
    render template: 'errors/error_500', status: :internal_server_error, layout: 'application'
  end

  protected

  def basic
    authenticate_or_request_with_http_basic do |user, _pass|
      user == ENV['BASIC_USER'] && pass = ENV['BASIC_PASS']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
