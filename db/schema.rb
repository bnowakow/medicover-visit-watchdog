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

ActiveRecord::Schema.define(version: 20150213015211) do

  create_table "medicover_apis", force: :cascade do |t|
    t.string   "url"
    t.text     "token"
    t.string   "new_visit_path"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "refresh_token_path"
  end

  create_table "medicover_visit_queries", force: :cascade do |t|
    t.integer  "region"
    t.integer  "booking_type"
    t.integer  "specialization"
    t.integer  "clinic"
    t.integer  "language"
    t.integer  "doctor"
    t.datetime "search_since"
    t.datetime "search_for_next_since"
    t.integer  "period_of_the_day"
    t.boolean  "set_because_of_pcc"
    t.boolean  "is_set_because_promote_specialization"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "medicover_visits_watchdogs", force: :cascade do |t|
    t.integer  "medicover_visit_query_id"
    t.datetime "first_possible_appointment_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "medicover_visits_watchdogs", ["medicover_visit_query_id"], name: "index_medicover_visits_watchdogs_on_medicover_visit_query_id"

end
