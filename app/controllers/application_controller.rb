class ApplicationController < ActionController::Base
  before_action :configure_custom_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
  flash[:authorization_error] = "Not authorized to perform that action ❌"
  redirect_to courses_path
  end 

  protected

  def configure_custom_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end  
end
