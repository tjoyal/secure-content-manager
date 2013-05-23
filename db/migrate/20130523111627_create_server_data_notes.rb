class CreateServerDataNotes < ActiveRecord::Migration
  def change
    create_table :server_data_notes do |t|

      t.references :server

      t.string :name
      t.text :note

      t.timestamps
    end
  end
end
