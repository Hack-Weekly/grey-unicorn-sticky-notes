class AddGuestIdToStickyNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :sticky_notes, :guest_id, :string
  end
end
