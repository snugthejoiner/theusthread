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

ActiveRecord::Schema.define(version: 20150821032150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "historical_events", force: :cascade do |t|
    t.string   "description"
    t.date     "starting"
    t.date     "ending"
    t.string   "premilestone_status"
    t.string   "ongoing_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.date     "born"
    t.date     "died"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "personal_events", force: :cascade do |t|
    t.string   "description"
    t.date     "starting"
    t.date     "ending"
    t.boolean  "private"
    t.integer  "person_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "personal_events", ["person_id"], name: "index_personal_events_on_person_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "historical_event_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "tags", ["historical_event_id"], name: "index_tags_on_historical_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "people", "users"
  add_foreign_key "personal_events", "people"
  add_foreign_key "tags", "historical_events"
end
