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

ActiveRecord::Schema.define(version: 20160928055821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "phrase_id"
    t.string   "screen_name", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "mutedtweet"
    t.index ["phrase_id"], name: "index_followers_on_phrase_id", using: :btree
    t.index ["user_id"], name: "index_followers_on_user_id", using: :btree
  end

  create_table "phrases", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phrase",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phrases_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.text     "token",      null: false
    t.text     "secret",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
