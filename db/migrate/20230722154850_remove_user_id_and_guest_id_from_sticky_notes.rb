class RemoveUserIdAndGuestIdFromStickyNotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :sticky_notes, :user_id, :integer
    remove_column :sticky_notes, :guest_id, :string
  end
end
