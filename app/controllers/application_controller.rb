class ApplicationController < ActionController::Base
  include Pundit::Authorization

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  protected

  def pundit_user
    current_user || guest_identifier
  end

  def guest_identifier
    Guest.find_by(id: cookies[:guest_identifier]) || create_guest
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  private

  def create_guest
    guest = Guest.create!
    cookies[:guest_identifier] = { value: guest.id, expires: 1.month.from_now }
    guest
  end
end
