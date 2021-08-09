class CreatePurrs < ActiveRecord::Migration[6.1]
  def change
    create_table :purrs do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.references :purrable, polymorphic: true
      t.timestamps
    end

    add_index :purrs, :user_id
  end
end
