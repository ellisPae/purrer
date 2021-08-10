# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_09_144506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_user_id"], name: "index_follows_on_followed_user_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "purr_id"
    t.integer "reply_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purr_id"], name: "index_likes_on_purr_id"
    t.index ["reply_id"], name: "index_likes_on_reply_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "purrs", force: :cascade do |t|
    t.text "content", null: false
    t.integer "user_id", null: false
    t.bigint "original_purr_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["original_purr_id"], name: "index_purrs_on_original_purr_id"
    t.index ["user_id"], name: "index_purrs_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id", null: false
    t.integer "purr_id"
    t.string "parent_type"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_type", "parent_id"], name: "index_replies_on_parent"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "handle"
    t.string "phone_number"
    t.date "dob", null: false
    t.text "bio"
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dob"], name: "index_users_on_dob"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["handle"], name: "index_users_on_handle", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

end
