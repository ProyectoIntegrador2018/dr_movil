class ApplicationController < ActionController::Base
  before_action :authenticate_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name birth_date
                                                         sex email doctor_id password
                                                         password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name birth_date
                                                                sex email doctor_id password 
                                                                password_confirmation])
  end

  def authenticate_user
    :authenticate_patient! || :authenticate_doctor!
  end
end
