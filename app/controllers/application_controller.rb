class ApplicationController < ActionController::Base
  before_action :configure_custom_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html", status: 403
  end

  protected

  def configure_custom_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:first_name, :last_name, :email, :password,
                    :password_confirmation, :is_mentor, :is_student)
    end
  end
end
