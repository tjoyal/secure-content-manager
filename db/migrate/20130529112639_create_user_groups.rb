class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.references :user
      t.references :group
      t.boolean :read
      t.boolean :edit
      t.boolean :manage

      t.timestamps
    end
    add_index :user_groups, :user_id
    add_index :user_groups, :group_id
  end
end
