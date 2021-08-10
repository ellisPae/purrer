class CreatePurrs < ActiveRecord::Migration[6.1]
  def change
    create_table :purrs do |t|
      t.text :content, null: false
      t.integer :user_id, null: false
      t.references :original_purr
      
      t.timestamps
    end

    add_index :purrs, :user_id
  end
end
