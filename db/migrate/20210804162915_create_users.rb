class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :handle
      t.string :phone_number
      t.date :dob, null: false
      t.text :bio
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :handle, unique: true
    add_index :users, :dob
    add_index :users, :session_token, unique: true
  end
end
