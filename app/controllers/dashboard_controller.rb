class DashboardController < ApplicationController
  def index
    @workspaces = policy_scope(Workspace).includes(whiteboards: :sticky_notes)
  end
end
