class AddLastViewedWorkspaceToUsersAndGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :users,  :last_viewed_workspace, foreign_key: { to_table: :workspaces }
    add_reference :guests, :last_viewed_workspace, foreign_key: { to_table: :workspaces }
  end
end
