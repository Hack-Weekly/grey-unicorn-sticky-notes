class AddUserIdToStickyNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :sticky_notes, :user, null: false, foreign_key: true
  end
end
