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

ActiveRecord::Schema.define(version: 20150711201113) do

  create_table "cycles", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "volume",     precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "ancestry"
  end

  add_index "cycles", ["ancestry"], name: "index_cycles_on_ancestry"

  create_table "macros", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.date     "startDate"
    t.date     "endDate"
    t.decimal  "volume",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "mesos", force: :cascade do |t|
    t.integer  "macro_id"
    t.string   "name"
    t.text     "notes"
    t.decimal  "volume",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "micros", force: :cascade do |t|
    t.integer  "meso_id"
    t.string   "name"
    t.text     "notes"
    t.decimal  "volume",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
