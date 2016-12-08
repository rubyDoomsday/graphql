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

ActiveRecord::Schema.define(version: 20161205194615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "metrics", force: :cascade do |t|
    t.jsonb    "data"
    t.integer  "summary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["summary_id"], name: "index_metrics_on_summary_id", using: :btree
  end

  create_table "summaries", force: :cascade do |t|
    t.date     "date"
    t.string   "category"
    t.string   "customer_id"
    t.string   "user_id"
    t.string   "uid"
    t.string   "origin"
    t.string   "source"
    t.string   "device_type"
    t.string   "device_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "metrics", "summaries"
end