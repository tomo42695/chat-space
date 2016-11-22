class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, :authenticate_user!
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) if devise_controller?
  end
end
