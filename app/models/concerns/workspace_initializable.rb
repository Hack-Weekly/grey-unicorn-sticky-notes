module WorkspaceInitializable
  extend ActiveSupport::Concern

  included do
    after_create :create_initial_workspace_and_whiteboard
  end

  private

  def create_initial_workspace_and_whiteboard
    workspace = workspaces.create!(name: "My Workspace")
    workspace.whiteboards.create!(title: "Whiteboard #1")
    update!(last_viewed_workspace: workspace)
  end
end
