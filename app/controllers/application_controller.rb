class ApplicationController < ActionController::Base
  include Pundit::Authorization

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  protected

  def pundit_user
    user_signed_in? ? current_user : guest_identifier
  end

  def guest_identifier
    if cookies[:guest_identifier]
      Guest.find(cookies[:guest_identifier])
    else
      guest = Guest.create!
      cookies[:guest_identifier] = { value: guest.id, expires: 1.month.from_now }
      guest
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
