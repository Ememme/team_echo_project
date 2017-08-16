class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ roles: [] }, :email, :password, :password_confirmation, :current_password, :nick, :name)
    end
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  def root_path
    if user_signed_in?
      authenticated_root_path
    else
      unauthenticated_root_path
    end
  end

  def root_url
    if user_signed_in?
      authenticated_root_url
    else
      unauthenticated_root_url
    end
  end

  helper_method :root_path, :root_url
end
