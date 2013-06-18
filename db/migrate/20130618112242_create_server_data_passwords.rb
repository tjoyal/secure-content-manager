class CreateServerDataPasswords < ActiveRecord::Migration
  def change
    create_table :server_data_passwords do |t|
      t.references :server

      t.string :name
      t.string :username
      t.string :encrypted_password
      t.text :note

      t.timestamps
    end
    add_index :server_data_passwords, :server_id
  end
end
