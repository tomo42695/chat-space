class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer :users_id
      t.integer :groups_id
      t.timestamps
    end
  end
end
