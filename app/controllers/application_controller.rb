class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name  
    devise_parameter_sanitizer.for(:sign_in) << :name  
    devise_parameter_sanitizer.for(:account_update) << :name  
    devise_parameter_sanitizer.for(:sign_up) << :date_of_birth 
    devise_parameter_sanitizer.for(:sign_in) << :date_of_birth
    devise_parameter_sanitizer.for(:account_update) << :date_of_birth 
  end

    def after_sign_in_path_for(resource)
  		  posds_path
	  end
    
    def after_sign_out_path_for(resource_or_scope)
  		  request.referrer
		end
end
