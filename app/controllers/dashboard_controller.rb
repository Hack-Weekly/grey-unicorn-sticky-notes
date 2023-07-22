class DashboardController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    @workspace = pundit_user.last_viewed_workspace || pundit_user.workspaces.first
    authorize(@workspace)
  end
end
