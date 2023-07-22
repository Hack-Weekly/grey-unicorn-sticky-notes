class AddWhiteboardToStickyNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :sticky_notes, :whiteboard, null: false, foreign_key: true
  end
end
