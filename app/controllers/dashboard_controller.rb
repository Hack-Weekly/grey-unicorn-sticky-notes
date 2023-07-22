class DashboardController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    @workspace = pundit_user.last_viewed_workspace
    authorize(@workspace)
  end
end
