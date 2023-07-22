class AddUniqueIndexToWorkspace < ActiveRecord::Migration[7.0]
  def change
    add_index :workspaces, [:name, :owner_id, :owner_type], unique: true
  end
end
