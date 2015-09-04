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

ActiveRecord::Schema.define(version: 20150902204827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cycles", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "volume",     precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "ancestry"
    t.string   "type"
  end

  add_index "cycles", ["ancestry"], name: "index_cycles_on_ancestry", using: :btree

  create_table "moves", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "notes"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "distance",   precision: 8, scale: 3, default: 0.0
    t.time     "duration"
    t.string   "ancestry"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "moves", ["ancestry"], name: "index_moves_on_ancestry", using: :btree

  create_table "steps", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "times"
    t.decimal  "distance",   precision: 8, scale: 3, default: 0.0
    t.time     "duration"
    t.time     "pace"
    t.integer  "intensity"
    t.time     "rest"
    t.integer  "move_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                               null: false
    t.string   "email",                                  null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.date     "birthDate"
    t.string   "sex",                          limit: 1
    t.string   "type"
    t.integer  "trainer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
