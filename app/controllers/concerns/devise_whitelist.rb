module DeviseWhitelist
    extend ActiveSupport::Concern

    # will refactor this next lesson to move the devise settings for a better practice
    # this violates the SRP, when you describe a class and have to say 'and' then you should probably 
    # break up that class 
    # before_filter has been deprecated in Rails 5.0 and removed in 5.1.
    # This was in ApplicationController before.
    included do
        before_action :configure_permitted_parameters, if: :devise_controller?
    end

    def configure_permitted_parameters
        # specific to Rails 5?
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end