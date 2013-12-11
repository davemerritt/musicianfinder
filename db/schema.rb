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

ActiveRecord::Schema.define(version: 20131211233256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "references", force: true do |t|
    t.text     "comment"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "target_id"
    t.integer  "feedback_value"
    t.boolean  "jammed"
    t.boolean  "performed"
    t.boolean  "recorded"
  end

  add_index "references", ["source_id"], name: "index_references_on_source_id", using: :btree
  add_index "references", ["target_id", "source_id"], name: "index_references_on_target_id_and_source_id", using: :btree
  add_index "references", ["target_id"], name: "index_references_on_target_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "postal_code"
    t.text     "bio"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
