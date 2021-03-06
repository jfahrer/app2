# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160228032212) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "category"
    t.datetime "time"
    t.boolean  "been_there"
    t.integer  "status",      default: 0
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "matches", ["event_id"], name: "index_matches_on_event_id"
  add_index "matches", ["user_id"], name: "index_matches_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "stars"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["event_id"], name: "index_reviews_on_event_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "age"
    t.string   "auth_token"
    t.string   "avatar"
  end

end
