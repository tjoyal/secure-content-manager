class CreateServerDataKeys < ActiveRecord::Migration
  def change
    create_table :server_data_keys do |t|

      t.references :server

      t.text :name
      t.text :encrypted_private_key
      t.text :public_key
      t.text :note

      t.timestamps
    end
  end
end
