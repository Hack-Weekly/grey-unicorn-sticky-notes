class ApplicationController < ActionController::Base
  include Pundit::Authorization

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  protected

  def pundit_user
    user_signed_in? ? current_user : Guest.new(guest_identifier)
  end

  def guest_identifier
    cookies[:guest_identifier] ||= { value: SecureRandom.uuid, expires: 1.month }
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
