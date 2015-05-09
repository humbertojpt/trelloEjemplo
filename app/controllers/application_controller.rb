class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  before_action :set_locale

 def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

def default_url_options(options={})
  { locale: I18n.locale }
end
protected
 
	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) do |u|
	    u.permit(:username, :name, :lastname, :email, :password, :avatar, :password_confirmation)
	  end
	  devise_parameter_sanitizer.for(:account_update) do |u|
	    u.permit(:username, :name, :lastname, :email, :password, :avatar, :password_confirmation, :current_password)
	  end
	end
end
