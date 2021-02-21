module CurrentUserConcern
    extend ActiveSupport::Concern

  # Starting in the app controller but then we will move to concern
  # overriding the method, we want current_user to always be
  # available even when no user is logged in
  def current_user
    # Super gives the exact behavior for the method we are overriding
    super || guest_user
    # guest_user method was inline 
  end

  def guest_user
    OpenStruct.new(name: "Guest User", 
                first_name: "Guest", 
                last_name: "User",
                email:"guest@example.com")
  end
end