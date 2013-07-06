class AddUsersFields < ActiveRecord::Migration
  def change

    add_column :users, :admin, :boolean
    add_column :users, :api_key, :string

  end
end
