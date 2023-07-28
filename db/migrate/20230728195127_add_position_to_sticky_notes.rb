class AddPositionToStickyNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :sticky_notes, :position, :integer
  end
end
