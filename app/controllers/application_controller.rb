# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Cancan::AccessDenied, with: :catch_exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end


  protected

  def catch_exception(exception)
    redirect_to root_path, alert: exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[matricula name
                                               email password
                                               password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login password
                                               password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[matricula name email
                                               password_confirmation
                                               current_password])
  end
end
