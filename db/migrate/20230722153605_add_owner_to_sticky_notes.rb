class AddOwnerToStickyNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :sticky_notes, :owner, polymorphic: true, null: false
  end
end
