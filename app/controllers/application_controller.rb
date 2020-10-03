class ApplicationController < ActionController::Base
  before_action :configure_custom_parameters, if: :devise_controller?

  # Renders user to 403 page if not authorised to access a page
  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html", status: 403
  end

  protected

  # sanitises user inputs from devise sign up form 
  # to ensure user accounts are properly created
  def configure_custom_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:first_name, :last_name, :email, :password,
                    :password_confirmation, :is_mentor, :is_student)
    end
  end
end
