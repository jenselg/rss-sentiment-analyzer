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

ActiveRecord::Schema.define(version: 2018_04_27_130821) do

  create_table "feeds", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.text "description"
    t.string "copyright"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.text "description"
    t.float "score"
    t.datetime "published_at"
    t.integer "feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "published_epoch"
    t.index ["feed_id"], name: "index_items_on_feed_id"
  end

  create_table "lexicons", force: :cascade do |t|
    t.string "word"
    t.float "sentiment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "published_epoch"
    t.datetime "published_at"
  end

end
