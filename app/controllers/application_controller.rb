class ApplicationController < ActionController::Base
    # rails 5 has protect_from_forgery with: :exception
    
    # will refactor this next lesson to move the devise settings for a better practice
    # before_filter has been deprecated in Rails 5.0 and removed in 5.1.
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        # specific to Rails 5?
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
