# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_26_012618) do

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "club_category"
    t.string "description"
    t.string "state"
    t.string "city"
    t.string "contact"
    t.integer "admin"
    t.boolean "has_max", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "count"
    t.datetime "meeting_datetime"
    t.integer "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_meetings_on_club_id"
  end

  create_table "user_clubs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "club_id"
    t.boolean "favorite_club"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_user_clubs_on_club_id"
    t.index ["user_id"], name: "index_user_clubs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "club"
    t.string "state"
    t.string "city"
    t.float "utpr"
    t.float "skill"
    t.integer "score"
    t.string "image"
    t.string "uid"
    t.boolean "admin"
    t.boolean "trainer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end