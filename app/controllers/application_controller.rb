class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :user_name, :picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :user_name, :picture])

    # when sign_up, allow :role, :address and :user_name to be passed and saved to db
  end
end
