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

ActiveRecord::Schema[8.0].define(version: 2025_02_07_150600) do
  create_table "friendships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id", null: false
    t.integer "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.integer "friend_user_id"
    t.integer "status_gift_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "shared_wish_lists", force: :cascade do |t|
    t.integer "fr_id", null: false
    t.integer "wl_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_friendships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_gifts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.boolean "is_public", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wish_lists_gifts", force: :cascade do |t|
    t.integer "wl_id", null: false
    t.integer "gift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "friendships", "status_friendships", column: "status_id"
  add_foreign_key "friendships", "users", column: "friend_id", on_delete: :cascade
  add_foreign_key "friendships", "users", on_delete: :cascade
  add_foreign_key "gifts", "status_gifts"
  add_foreign_key "gifts", "users", column: "friend_user_id", on_delete: :nullify
  add_foreign_key "sessions", "users"
  add_foreign_key "shared_wish_lists", "friendships", column: "fr_id", on_delete: :nullify
  add_foreign_key "shared_wish_lists", "wish_lists", column: "wl_id", on_delete: :cascade
  add_foreign_key "wish_lists", "users", on_delete: :nullify
  add_foreign_key "wish_lists_gifts", "gifts", on_delete: :cascade
  add_foreign_key "wish_lists_gifts", "wish_lists", column: "wl_id", on_delete: :cascade
end
