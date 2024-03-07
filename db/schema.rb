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

ActiveRecord::Schema[7.1].define(version: 2024_03_07_113310) do
  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date"
    t.string "organiser"
    t.integer "spaces"
    t.text "recommended_conditions"
    t.text "not_recommended_conditions"
    t.text "neutral_conditions"
    t.boolean "private"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "location"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "attendees", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_attendees_on_activity_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_bookmarks_on_activity_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "invites", force: :cascade do |t|
    t.boolean "status"
    t.integer "user_one_id", null: false
    t.integer "user_two_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_one_id"], name: "index_invites_on_user_one_id"
    t.index ["user_two_id"], name: "index_invites_on_user_two_id"
  end

  create_table "match_users", force: :cascade do |t|
    t.integer "match_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_users_on_match_id"
    t.index ["user_id"], name: "index_match_users_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "match_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_messages_on_match_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "gender"
    t.string "blood_type"
    t.string "allergies"
    t.string "medical_conditions"
    t.string "contact_phone_number"
    t.string "contact_address"
    t.string "preferred_comunication_language"
    t.string "emergency_contact_name"
    t.string "emergency_contact_phone"
    t.string "emergency_contact_relationship"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.integer "rating"
    t.integer "user_id", null: false
    t.integer "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_reviews_on_activity_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "users"
  add_foreign_key "attendees", "activities"
  add_foreign_key "attendees", "users"
  add_foreign_key "bookmarks", "activities"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "invites", "users", column: "user_one_id"
  add_foreign_key "invites", "users", column: "user_two_id"
  add_foreign_key "match_users", "matches"
  add_foreign_key "match_users", "users"
  add_foreign_key "messages", "matches"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "activities"
  add_foreign_key "reviews", "users"
end
