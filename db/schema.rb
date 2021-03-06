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

ActiveRecord::Schema.define(version: 20140227095222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocked_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "blocked_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new",        default: true
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new",           default: true
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed_by_sender",    default: false
    t.boolean  "removed_by_recipient", default: false
    t.boolean  "read",                 default: false
  end

  create_table "pics", force: true do |t|
    t.string   "image"
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "birthday"
    t.integer  "religion",               default: 0
    t.integer  "smokes",                 default: 0
    t.integer  "drinks",                 default: 0
    t.integer  "drugs",                  default: 0
    t.integer  "political_orientation",  default: 0
    t.integer  "diet",                   default: 0
    t.integer  "ethnicity",              default: 0
    t.integer  "height",                 default: 0
    t.integer  "body_type",              default: 0
    t.integer  "eye_color",              default: 0
    t.integer  "hair_color",             default: 0
    t.string   "headline",               default: ""
    t.text     "about_me",               default: ""
    t.text     "looking_for",            default: ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
