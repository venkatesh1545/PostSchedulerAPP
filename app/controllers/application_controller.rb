class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def set_current_user
    @current_user = current_user
  end

  def logout
    sign_out
    redirect_to root_path, notice: 'Signed out successfully.'
  end

  def after_sign_in_path_for(resource)
    posts_path
  end
end