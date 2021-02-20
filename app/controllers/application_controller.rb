class ApplicationController < ActionController::Base
  # rails 5 has protect_from_forgery with: :exception
  include DeviseWhitelist
  
  #better to do this in a concern
  before_action :set_source

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
