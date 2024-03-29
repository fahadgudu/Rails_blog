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

ActiveRecord::Schema.define(version: 20151013102458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "assets", force: :cascade do |t|
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.text     "filename"
    t.string   "content_type"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "assets", ["assetable_type", "assetable_id"], name: "index_assets_on_assetable_type_and_assetable_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "start_time"
    t.text     "body"
    t.text     "author"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "city",       default: "Nowhere"
    t.integer  "tag_ids",    default: [],                     array: true
  end

  add_index "events", ["tag_ids"], name: "index_events_on_tag_ids", using: :gin

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "tag_ids",    default: [],              array: true
    t.hstore   "settings",   default: {}, null: false
  end

  add_index "posts", ["tag_ids"], name: "index_posts_on_tag_ids", using: :gin

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "surname"
    t.string   "city"
    t.integer  "age"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "tag_ids",    default: [],              array: true
  end

  add_index "users", ["tag_ids"], name: "index_users_on_tag_ids", using: :gin

end
