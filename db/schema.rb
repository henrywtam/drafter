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

ActiveRecord::Schema.define(version: 20141217074626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_decks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_drafts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: true do |t|
    t.integer  "st_id"
    t.integer  "draft_id"
    t.integer  "deck_id"
    t.string   "card_type"
    t.string   "card_types"
    t.string   "colors"
    t.string   "multiverseid"
    t.string   "name"
    t.string   "subtypes"
    t.string   "rarity"
    t.string   "power"
    t.string   "toughness"
    t.string   "manaCost"
    t.string   "imageName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drafts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sts", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "releaseDate"
    t.string   "block"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
