class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :permit_params, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
