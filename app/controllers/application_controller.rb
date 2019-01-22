class ApplicationController < ActionController::Base
	

	protect_from_forgery with: :exception

	before_action :configure_devise_parameters, if: :devise_controller?


	protected

	def configure_devise_parameters
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation, :avatar) }
		devise_parameter_sanitizer.permit(:account_update, keys:[:username, :avatar]) 
	end
end
