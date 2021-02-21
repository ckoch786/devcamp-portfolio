class ApplicationController < ActionController::Base
  # rails 5 has protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
end
