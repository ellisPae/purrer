class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_user_id

      t.timestamps
    end
    add_index :follows, :follower_id
    add_index :follows, :followed_user_id
  end
end
