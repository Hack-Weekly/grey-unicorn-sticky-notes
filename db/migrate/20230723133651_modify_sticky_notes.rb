class ModifyStickyNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :sticky_notes, :color, :string
    add_column :sticky_notes, :due_date, :datetime
    add_column :sticky_notes, :active, :boolean, default: true
    add_column :sticky_notes, :pinned, :boolean, default: false

    remove_column :sticky_notes, :title, :string
    rename_column :sticky_notes, :body, :content
  end
end
