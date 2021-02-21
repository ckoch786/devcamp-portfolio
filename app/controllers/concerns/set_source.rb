module SetSource
    extend ActiveSupport::Concern

    included do 
        #before_filter :set_source - works in rails 5 what changed?
        before_action :set_source
    end

    def set_source
        session[:source] = params[:q] if params[:q]
    end
end