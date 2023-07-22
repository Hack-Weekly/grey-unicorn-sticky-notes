class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.datetime :expires_at

      t.timestamps
    end
  end
end
