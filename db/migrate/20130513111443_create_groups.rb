class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :parent
      t.string :name

      t.timestamps
    end
  end
end
