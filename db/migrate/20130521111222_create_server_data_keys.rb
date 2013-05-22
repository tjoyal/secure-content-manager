class CreateServerDataKeys < ActiveRecord::Migration
  def change
    create_table :server_data_keys do |t|

      t.references :server

      t.text :note
      t.text :private_key
      t.text :public_key

      t.timestamps
    end
  end
end
