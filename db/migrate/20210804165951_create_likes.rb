class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :purr_id
      t.integer :reply_id
      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :purr_id
    add_index :likes, :reply_id
  end
end
