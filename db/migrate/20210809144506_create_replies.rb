class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :purr_id
      t.references :parent, polymorphic: true

      t.timestamps
    end
  end
end
