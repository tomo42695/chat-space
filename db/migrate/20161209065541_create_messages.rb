class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.text :image
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
