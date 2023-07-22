class RemoveUserNotNullConstraintFromStickyNotes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :sticky_notes, :user_id, true
  end
end
