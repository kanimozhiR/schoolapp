class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		#devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:terms_of_service,:role,:is_active])
	  #devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:terms_of_service,:role, :is_active])
		devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.permit(:email, :password, :password_confirmation, :role)
    }
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:email, :password, :password_confirmation,:current_password, :role)
    }
	end
	
end
