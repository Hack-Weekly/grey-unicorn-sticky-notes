class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.references :owner, polymorphic: true, null: false

      t.timestamps
    end
  end
end
