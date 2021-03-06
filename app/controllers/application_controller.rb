class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :set_site_by_subdomain

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :name, :intro, :image, :password, :password_confirmation)}
  end
  
  def set_site_by_subdomain
    @site = Site.where(subdomain: request.try(:subdomain)).first
  end
end
