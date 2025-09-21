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

ActiveRecord::Schema[8.0].define(version: 2025_09_11_212515) do
  create_table "chats", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "initializer_id", null: false
    t.bigint "receptor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["initializer_id"], name: "fk_chat_initializer_id"
    t.index ["receptor_id"], name: "fk_chat_receptor_id"
  end

  create_table "messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "text_message"
    t.bigint "answer_id"
    t.bigint "chat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "fk_message_answer_id"
    t.index ["chat_id"], name: "fk_message_chat_id"
    t.index ["user_id"], name: "fk_message_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chats", "users", column: "initializer_id", name: "fk_chat_initializer_id"
  add_foreign_key "chats", "users", column: "receptor_id", name: "fk_chat_receptor_id"
  add_foreign_key "messages", "chats", name: "fk_message_chat_id"
  add_foreign_key "messages", "messages", column: "answer_id", name: "fk_message_answer_id"
  add_foreign_key "messages", "users", name: "fk_message_user_id"
end
